//
//  TokenManager.swift
//  practice-jwt-front-ios
//
//  Created by suojae on 10/2/24.
//

import Foundation

final class TokenManager {
    private let keychainStorage: KeychainStorage
    private let accessTokenKey = "accessToken"
    private let refreshTokenKey = "refreshToken"

    init(keychainStorage: KeychainStorage) {
        self.keychainStorage = keychainStorage
    }

    func saveAccessToken(token: String) {
        if let data = token.data(using: .utf8) {
            keychainStorage.save(key: accessTokenKey, data: data)
        }
    }

    func getAccessToken() -> String? {
        guard let data = keychainStorage.load(key: accessTokenKey),
              let token = String(data: data, encoding: .utf8) else {
            return nil
        }
        return token
    }

    func saveRefreshToken(token: String) {
        if let data = token.data(using: .utf8) {
            keychainStorage.save(key: refreshTokenKey, data: data)
        }
    }

    func getRefreshToken() -> String? {
        guard let data = keychainStorage.load(key: refreshTokenKey),
              let token = String(data: data, encoding: .utf8) else {
            return nil
        }
        return token
    }

    func isTokenValid() -> Bool {
        // 토큰의 유효성 검사를 구현합니다.
        // 예를 들어, 토큰의 만료 시간을 확인하거나 JWT를 디코딩하여 검사할 수 있습니다.
        // 여기서는 간단히 액세스 토큰의 존재 여부로 판단합니다.
        return getAccessToken() != nil
    }

    func clearTokens() {
        keychainStorage.delete(key: accessTokenKey)
        keychainStorage.delete(key: refreshTokenKey)
    }
}
