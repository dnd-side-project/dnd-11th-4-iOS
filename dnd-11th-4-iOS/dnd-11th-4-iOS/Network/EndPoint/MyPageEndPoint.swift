//
//  MyPageEndPoint.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/10/24.
//

import Foundation
import Alamofire

enum MyPageEndPoint {
    case getMyPageAPI(MyPageRequest)
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
        switch self {
        case .getMyPageAPI(let id):
            return .query(["id": id])
        }
    }
    
    var headers: HTTPHeaders? {
        return .none
    }
}