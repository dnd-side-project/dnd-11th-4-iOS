//
//  RecordEndPoint.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/10/24.
//

import Foundation
import Alamofire

enum RecordEndPoint {
    case postRecordAPI(RecordRequest)
    case updateRecordAPI(RecordId, photos: [String], updateRecordRequest: UpdateRecordRequest)
    case deleteRecordAPI(RecordId)
}

extension RecordEndPoint: BaseEndpoint {
    var baseURL: String {
        return Environment.baseURL
    }
    
    var path: String {
        switch self {
        case .updateRecordAPI, .deleteRecordAPI:
            return "/maps/history"
        case .postRecordAPI:
            return "/maps/record"
        }
        
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .postRecordAPI:
            return .post
        case .updateRecordAPI:
            return .put
        case .deleteRecordAPI:
            return .delete
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .postRecordAPI(let request):
            return .body(request)
        case .updateRecordAPI(let id, let photos, let updateRecordRequest):
            return .queryAndBody(query: id, body: updateRecordRequest)
        case .deleteRecordAPI(let id):
            return .query(id)
        }
    }
    
    var headers: HTTPHeaders? {
        return .none
    }
}
