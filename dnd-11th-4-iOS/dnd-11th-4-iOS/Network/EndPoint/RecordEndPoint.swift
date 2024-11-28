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
    case updateRecordAPI(request: RecordRequest, photos: RecordPhotos, id: RecordId)
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
        case .deleteRecordAPI(let id), .updateRecordAPI(_, _, let id):
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
        case .updateRecordAPI(let request, let requestPhotos, _):
            let multipartFormData = MultipartFormData()
            let recordRequest = try! JSONEncoder().encode(request.recordRequest)
            multipartFormData.append(recordRequest, withName: "updateRecordRequest")
            
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
        guard let token = TokenManager.shared.getAccessToken() else {
            return .none
        }
        switch self {
        case .postRecordAPI, .updateRecordAPI:
            return ["Content-Type": "multipart/form-data",
                    "Authorization": "Bearer \(token)"]
        case .deleteRecordAPI:
            return [
                "accept": "application/json",
                "Authorization": "Bearer \(token)"
            ]
        }
    }
}
