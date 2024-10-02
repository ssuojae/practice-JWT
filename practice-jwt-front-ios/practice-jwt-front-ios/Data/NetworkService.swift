//
//  NetworkService.swift
//  practice-jwt-front-ios
//
//  Created by suojae on 10/2/24.
//

import Foundation
import RxSwift
import Alamofire

private enum NetworkError: Error {
    case invalidURLRequest
    case unknownResponse
    case statusError(statusCode: Int)
    case decodingError(Error)
    case unknownError
}

final class NetworkService {
    private let baseURL: URL
    private let session: Session

    init(baseURL: URL, session: Session = .default) {
        self.baseURL = baseURL
        self.session = session
    }

    // MARK: - 요청 수행 메서드 (제네릭)
    // 서버로부터 응답 데이터를 받아서 특정 타입으로 디코딩해야 할 때 사용!
    func performRequest<T: Decodable>(endpoint: APIEndpoint, responseType: T.Type) -> Observable<T> {
        return createURLRequest(endpoint: endpoint)
            .flatMap(sendRequest)
            .flatMap { data in self.decode(data: data, to: responseType) }
    }

    // MARK: - 요청 수행 메서드 (Void 반환)
    // 서버로부터 특별히 처리할 응답 데이터가 없을 때 사용!
    func performRequest(endpoint: APIEndpoint) -> Observable<Void> {
        return createURLRequest(endpoint: endpoint)
            .flatMap(sendRequest)
            .map { _ in () }
    }

    // MARK: - helper methods
    private func createURLRequest(endpoint: APIEndpoint) -> Observable<URLRequest> {
        return Observable.create { [weak self] observer in
            guard let self = self else {
                observer.onError(NetworkError.unknownError)
                return Disposables.create()
            }
            if let urlRequest = endpoint.makeURLRequest(baseURL: self.baseURL) {
                observer.onNext(urlRequest)
                observer.onCompleted()
            } else {
                observer.onError(NetworkError.invalidURLRequest)
            }
            return Disposables.create()
        }
    }

    private func sendRequest(urlRequest: URLRequest) -> Observable<Data> {
        return Observable.create { [weak self] observer in
            guard let self = self else {
                observer.onError(NetworkError.unknownError)
                return Disposables.create()
            }

            let request = self.session.request(urlRequest)
                .validate(statusCode: 200..<300)
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        observer.onNext(data)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }

            return Disposables.create {
                request.cancel()
            }
        }
    }

    private func decode<T: Decodable>(data: Data, to type: T.Type) -> Observable<T> {
        return Observable.create { observer in
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                observer.onNext(decodedData)
                observer.onCompleted()
            } catch let error {
                observer.onError(NetworkError.decodingError(error))
            }
            return Disposables.create()
        }
    }
}
