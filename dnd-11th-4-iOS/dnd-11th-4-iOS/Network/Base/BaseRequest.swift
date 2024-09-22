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
            let request = APIManager.session.request(endPoint)
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
    
    static func multiPartRequest<T: Decodable>(_ endPoint: BaseEndpoint) -> Observable<T> {
        return Observable.create { observer in
            let request = APIManager.session.upload(multipartFormData: endPoint.multipart ?? MultipartFormData(),
                                                    with: endPoint)
                .responseDecodable { (response: AFDataResponse<T>) in
                    switch response.result {
                    case .success(let result):
                            observer.onNext(result)
                            observer.onCompleted()
                    case .failure(_):
                        guard let statusCode = response.response?.statusCode else { return }
                        let error = NetworkManager.statusCodeErrorHandling(statusCode)
                        observer.onError(error)
                    }
                }
            return Disposables.create { request.cancel() }
        }
    }
}
