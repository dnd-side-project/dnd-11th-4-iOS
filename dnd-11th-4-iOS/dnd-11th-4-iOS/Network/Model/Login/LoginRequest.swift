//
//  LoginRequest.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/9/24.
//

import Foundation

struct LoginRequest: Codable {
    let appleToken: String
    let selectedColor: String
}

struct RefreshTokenRequest: Codable {
    let refreshToken: String
}
