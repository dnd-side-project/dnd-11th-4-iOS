//
//  LoginEndPoint.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/10/24.
//

import Foundation
import Alamofire

enum LoginEndPoint {
    case appleLoginAPI(LoginRequest)
    case reIssueTokenAPI(RefreshTokenRequest)
    case withdrawAPI(WithdrawRequest)
}

extension LoginEndPoint: BaseEndpoint {
    var baseURL: String {
        return Environment.baseURL
    }
    
    var path: String {
        switch self {
        case .appleLoginAPI:
            return "/login/oauth2/apple"
        case .reIssueTokenAPI:
            return "/reissue/token"
        case .withdrawAPI:
            return "/withdraw"
        }
        
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .appleLoginAPI, .reIssueTokenAPI:
            return .post
        case .withdrawAPI:
            return .delete
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .appleLoginAPI(let loginRequest):
            return .body(loginRequest)
        case .reIssueTokenAPI(let refreshRequest):
            return .body(refreshRequest)
        case .withdrawAPI(let authCode):
            return .body(authCode)
        }
    }
    
    var headers: HTTPHeaders? {
        return [
            "Content-Type": "application/json",
            "accept": "application/json"
        ]
    }
}
