//
//  RecordEndPoint.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/10/24.
//

import Foundation
import Alamofire

enum RecordEndPoint {
    case getRecordAPI(recordId: Int)
    case postRecordAPI(RecordRequest)
    case updateRecordAPI(recordId: Int, photos: [String], updateRecordRequest: RecordRequest)
    case deleteRecordAPI(recordId: Int)
}

extension RecordEndPoint: BaseEndpoint {
    var baseURL: String {
        return Environment.baseURL
    }
    
    var path: String {
        switch self {
        case .getRecordAPI, .updateRecordAPI, .deleteRecordAPI:
            return "/maps/history"
        case .postRecordAPI:
            return "/maps/record"
        }
        
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getRecordAPI:
            return .get
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
        case .getRecordAPI(let recordId):
            return .query(["recordId": recordId])
        case .postRecordAPI(let record):
            return .body(record)
        case .updateRecordAPI(let recordId, let photos, let updateRecordRequest):
            return .body(updateRecordRequest)
        case .deleteRecordAPI(let recordId):
            return .query(["recordId": recordId])
        }
    }
    
    var headers: HTTPHeaders? {
        return .none
    }
}
