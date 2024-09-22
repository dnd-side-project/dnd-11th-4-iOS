//
//  RecordListService.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/22/24.
//

import Foundation
import Alamofire
import RxSwift

final class RecordListService {
    static func getRecordListAPI() -> Observable<RecordListResponse> {
        return BaseRequest.request(RecordListEndPoint.getRecordListAPI(cursorNo: 0, displayPerPage: 10))
    }
}
