//
//  MyPageService.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/26/24.
//

import Foundation
import Alamofire
import RxSwift

final class MyPageService {
    static func getMyPageAPI() -> Observable<MyPageResponse> {
        return BaseRequest.request(MyPageEndPoint.getMyPageAPI)
    }
}
