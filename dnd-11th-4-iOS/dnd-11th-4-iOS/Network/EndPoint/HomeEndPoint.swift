//
//  HomeEndPoint.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/26/24.
//

import Foundation
import Alamofire

enum HomeEndPoint {
    case getHomeAPI
}

extension HomeEndPoint: BaseEndpoint {
    var baseURL: String {
        return Environment.baseURL
    }
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/maps"
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
