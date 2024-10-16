//
//  TokenManager.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/26/24.
//

import Foundation

final class TokenManager {
    private enum Keys {
        static let accessToken = "accessToken"
        static let refreshToken = "refreshToken"
    }
    
    static let shared = TokenManager()
    
    private var temporaryToken: String?

    private init() {}
    
    func setTemporaryToken(_ token: String) {
        self.temporaryToken = token
    }
    
    func getTemporaryToken() -> String? {
        return temporaryToken
    }

    func saveTokens(accessToken: String, refreshToken: String) {
        UserDefaults.standard.set(accessToken, forKey: Keys.accessToken)
        UserDefaults.standard.set(refreshToken, forKey: Keys.refreshToken)
        temporaryToken = nil
    }

    func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: Keys.accessToken)
    }

    func getRefreshToken() -> String? {
        return UserDefaults.standard.string(forKey: Keys.refreshToken)
    }

    func clearTokens() {
        UserDefaults.standard.removeObject(forKey: Keys.accessToken)
        UserDefaults.standard.removeObject(forKey: Keys.refreshToken)
    }
}
