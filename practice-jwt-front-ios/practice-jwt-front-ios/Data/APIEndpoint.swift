//
//  APIEndpoint.swift
//  practice-jwt-front-ios
//
//  Created by suojae on 10/2/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

final class APIEndpoint {
    let path: String
    let method: HTTPMethod
    let queryParameters: [String: String]
    let bodyParameters: [String: Any]
    let headers: [String: String]

    private init(builder: Builder) {
        self.path = builder.path
        self.method = builder.method
        self.queryParameters = builder.queryParameters
        self.bodyParameters = builder.bodyParameters
        self.headers = builder.headers
    }

    func makeURLRequest(baseURL: URL) -> URLRequest? {
        guard let url = constructURL(baseURL: baseURL) else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        addHeaders(to: &request)
        addBody(to: &request)

        return request
    }

    private func constructURL(baseURL: URL) -> URL? {
        var urlComponents = URLComponents(
            url: baseURL.appendingPathComponent(path),
            resolvingAgainstBaseURL: false
        )
        if !queryParameters.isEmpty {
            urlComponents?.queryItems = queryParameters.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
        }
        return urlComponents?.url
    }

    private func addHeaders(to request: inout URLRequest) {
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
    }

    private func addBody(to request: inout URLRequest) {
        guard !bodyParameters.isEmpty, method == .post || method == .put else {
            return
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(
            withJSONObject: bodyParameters,
            options: []
        )
    }

    private class Builder {
        let path: String
        var method: HTTPMethod = .get
        var queryParameters: [String: String] = [:]
        var bodyParameters: [String: Any] = [:]
        var headers: [String: String] = [:]

        init(path: String) {
            self.path = path
        }

        func setMethod(_ method: HTTPMethod) -> Builder {
            self.method = method
            return self
        }

        func addQueryParameter(key: String, value: String) -> Builder {
            queryParameters[key] = value
            return self
        }

        func addBodyParameter(key: String, value: Any) -> Builder {
            bodyParameters[key] = value
            return self
        }

        func addHeader(key: String, value: String) -> Builder {
            headers[key] = value
            return self
        }

        func build() -> APIEndpoint {
            return APIEndpoint(builder: self)
        }
    }
}
