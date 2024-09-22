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
    static func getHomeAPI() -> Observable<HomeResponse> {
        return BaseRequest.request(HomeEndPoint.getHomeAPI)
    }
}
