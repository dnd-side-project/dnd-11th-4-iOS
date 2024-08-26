//
//  MDError.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/26/24.
//

import Foundation

enum MDError: Error {
    
    case tokenError
    case clientError
    case serverError
    
    var text: String {
        switch self {
        case .tokenError:
            return "다시 로그인 해주세요"
        case .clientError:
            return "시스템 오류입니다. 다시 요청해 주세요."
        case .serverError:
            return "네트워크 오류입니다. 다시 요청해 주세요"
        }
    }
}
