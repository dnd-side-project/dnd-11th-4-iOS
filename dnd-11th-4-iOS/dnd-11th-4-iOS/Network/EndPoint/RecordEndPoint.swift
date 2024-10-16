//
//  RecordEndPoint.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/10/24.
//

import Foundation
import Alamofire

enum RecordEndPoint {
    case postRecordAPI(request: RecordRequest, photos: RecordPhotos)
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
            return .queryAndBody(query: id, body: updateRecordRequest as! Encodable)
        case .deleteRecordAPI(let id):
            return .query(id)
        }
    }
    
    var multipart: MultipartFormData? {
        switch self {
        case .postRecordAPI(let request, let requestPhotos):
            let multipartFormData = MultipartFormData()
            let recordRequest = try! JSONEncoder().encode(request.recordRequest)
            multipartFormData.append(recordRequest, withName: "recordRequest")
            
            if !requestPhotos.photos.isEmpty {
                for photo in requestPhotos.photos {
                    if let imageData = photo.jpegData(compressionQuality: 0.1) { // JPEG로 변환
                        multipartFormData.append(imageData,
                                                 withName: "photos",
                                                 fileName: "\(photo).png",
                                                 mimeType: "image/png")
                    }
                }
            }
            
            return multipartFormData
            
        default: return nil
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .postRecordAPI, .deleteRecordAPI, .updateRecordAPI:
            return ["Content-Type": "multipart/form-data",
                    "Authorization": "Bearer " + "eyJhbGciOiJIUzI1NiJ9.eyJtZW1iZXJJZCI6NCwiaWF0IjoxNzI4ODMzNDI0LCJleHAiOjE3Mjg4MzUyMjR9.yFMMyvoy814qteVFYpqO4J87A9kMe1ehegSIgD6qKa0"]
        }
    }
}
