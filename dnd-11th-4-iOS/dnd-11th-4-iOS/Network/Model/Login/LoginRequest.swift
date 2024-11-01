//
//  LoginRequest.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/9/24.
//

import Foundation

struct LoginRequest: Encodable {
    let authorizationCode: String
    let selectedColor: String
}

struct RefreshTokenRequest: Encodable {
    let refreshToken: String
}

struct WithdrawRequest: Encodable {
    //TODO: appleRefreshToken으로 변경
    let refreshToken: String
}
