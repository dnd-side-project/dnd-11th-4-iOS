//
//  HomeService.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/26/24.
//

import Foundation
import Alamofire
import RxSwift

final class HomeService {
    static func getHomeAPI() -> Single<UpdateResponse> {
        return BaseRequest.request(HomeEndPoint.getHomeAPI)
    }
}
