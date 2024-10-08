//
//  LoginService.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/24/24.
//

import Foundation
import Alamofire
import RxSwift

final class LoginService {
    static func appleLogin(token: String, color: String) -> Observable<LoginResponse> {
        let request = LoginRequest(appleToken: token, selectedColor: color)
        return BaseRequest.request(LoginEndPoint.appleLoginAPI(request))
    }
    
    static func reIssueToken(request: RefreshTokenRequest) -> Observable<LoginResponse> {
        return BaseRequest.request(LoginEndPoint.reIssueTokenAPI(request))
    }
    
    static func revokeToken(request: WithdrawRequest) -> Observable<Empty> {
        return BaseRequest.request(LoginEndPoint.withdrawAPI(request))
    }
}
