//
//  RecordEndPoint.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/10/24.
//

import Foundation
import Alamofire

enum RecordEndPoint {
    case postRecordAPI(request: RecordRequest, photos: [UIImage])
    case updateRecordAPI(RecordId, photos: [UIImage], updateRecordRequest: UpdateRecordRequest)
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
        case .postRecordAPI:
            return .none
        case .updateRecordAPI(let id, let photos, let updateRecordRequest):
            return .queryAndBody(query: id, body: updateRecordRequest)
        case .deleteRecordAPI(let id):
            return .query(id)
        }
    }
    
    var multipart: MultipartFormData? {
        switch self {
        case .postRecordAPI(let request, let photos):
            let multipartFormData = MultipartFormData()
            let requestData = request.toDictionary()
            
            for (key, value) in requestData {
                multipartFormData.append("\(value)".data(using: .utf8) ?? Data(), withName: key)
            }
            
            for photo in photos {
                multipartFormData.append(photo.pngData() ?? Data(),
                                         withName: "image",
                                         fileName: "\(photo).png",
                                         mimeType: "image/png")
            }
            return multipartFormData
        default: return nil
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .postRecordAPI, .deleteRecordAPI, .updateRecordAPI:
            return ["Content-Type": "multipart/form-data",
                    "Authorization": "Bearer " + "eyJhbGciOiJIUzI1NiJ9.eyJtZW1iZXJJZCI6MiwiaWF0IjoxNzI2OTIzOTAwLCJleHAiOjE3MjY5MjU3MDB9.FQngkXueyRb-7gDKt9qx4xqPDfPC7IiO6h05a2TJ7eE"]  
        }
    }
}
