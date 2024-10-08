//
//  MyPageEndPoint.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/10/24.
//

import Foundation
import Alamofire

enum MyPageEndPoint {
    case getMyPageAPI
}

extension MyPageEndPoint: BaseEndpoint {
    var baseURL: String {
        return Environment.baseURL
    }
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/mypages"
    }
    
    var parameters: RequestParams {
        return .none
    }
    
    var headers: HTTPHeaders? {
        guard let token = TokenManager.shared.getAccessToken() else {
            return .none
        }
        return [
        "accept": "application/json",
        "Authorization": "Bearer \(token)"
        ]
    }
}
