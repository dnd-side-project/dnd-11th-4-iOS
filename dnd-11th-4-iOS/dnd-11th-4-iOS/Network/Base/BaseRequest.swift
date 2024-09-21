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
    static func request<T: Decodable>(_ endPoint: BaseEndpoint) -> Observable<Result<T, MDError>> {
        return Observable.create { observer in
            let request = APIManager.session.request(endPoint)
                .responseDecodable { (response: AFDataResponse<T>) in
                    switch response.result {
                    case .success(let result):
                        do {
                            guard let statusCode = response.response?.statusCode else { return }
                            try NetworkManager.statusCodeErrorHandling(statusCode)
                            observer.onNext(.success(result))
                            observer.onCompleted()
                        } catch {
                            guard let error = error as? MDError else { return }
                            observer.onNext(.failure(error))
                            observer.onCompleted()
                        }
                    case .failure(_):
                        observer.onError(MDError.serverError)
                    }
                }
            return Disposables.create { request.cancel() }
        }
    }
}
