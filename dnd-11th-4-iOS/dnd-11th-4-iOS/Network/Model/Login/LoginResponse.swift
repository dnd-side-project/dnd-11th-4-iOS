//
//  LoginResponse.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/9/24.
//

import Foundation

struct LoginResponse: Decodable {
    let accessToken: String
    let refreshToken: String
}
