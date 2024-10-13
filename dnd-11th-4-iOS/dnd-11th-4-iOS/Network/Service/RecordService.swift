//
//  RecordService.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 9/22/24.
//

import Foundation
import Alamofire
import RxSwift

final class RecordService {
    
    static func postRecordAPI(request: RecordRequest, photos: RecordPhotos) -> Observable<Empty> {
        return BaseRequest.multiPartRequest(RecordEndPoint.postRecordAPI(request: request, photos: photos))
    }
}
