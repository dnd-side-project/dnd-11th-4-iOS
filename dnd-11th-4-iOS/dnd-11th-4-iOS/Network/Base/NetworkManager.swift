//
//  NetworkManager.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/26/24.
//

import Foundation

final class NetworkManager {
    static func statusCodeErrorHandling(_ statusCode: Int) -> MDError {
        switch statusCode {
        case 204:
            return MDError.tokenError
        case 400..<500:
            return MDError.clientError
        case 500...:
            return MDError.serverError
        default:
            return MDError.serverError
        }
    }
    
    static func handleError(_ error: Error) -> MDError {
        if let mdError = error as? MDError {
            return mdError
        } else {
            return MDError.castingError
        }
    }
}
