//
//  RecordListEndPoint.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/10/24.
//

import Foundation
import Alamofire

enum RecordListEndPoint {
    case getRecordListAPI(cursorNo: Int, displayPerPage: Int)
}

extension RecordListEndPoint: BaseEndpoint {
    var baseURL: String {
        return Environment.baseURL
    }
    
    var path: String {
        return "/maps/history"
    }
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var parameters: RequestParams {
        switch self {
        case .getRecordListAPI(let cursorNo, let displayPerPage):
            return .query([
                "cursorNo": cursorNo,
                "displayPerPage": displayPerPage
            ])
        }
    }
    
    var headers: HTTPHeaders? {
        return .none
    }
}
