//
//  BaseRequest.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/26/24.
//

import Foundation
import Alamofire
import RxSwift

final class BaseRequest {
    static func request<T: Decodable>(_ endPoint: BaseEndpoint) -> Single<T> {
        return Single.create { single in
            let request = AF.request(endPoint)
                .responseDecodable { (response: AFDataResponse<T>) in
                    switch response.result {
                    case .success(let result):
                        do {
                            guard let statusCode = response.response?.statusCode else { return }
                            try NetworkManager.statusCodeErrorHandling(statusCode)
                            single(.success(result))
                        } catch {
                            guard let error = error as? MDError else { return }
                            single(.failure(error))
                        }
                    case .failure(_):
                        single(.failure(MDError.serverError))
                    }
                }
            return Disposables.create { request.cancel() }
        }
    }
}
