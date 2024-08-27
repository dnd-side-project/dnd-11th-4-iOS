//
//  NetworkManager.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/26/24.
//

import Foundation

final class NetworkManager {
    static func statusCodeErrorHandling(_ statusCode: Int) throws {
        switch statusCode {
        case 204:
            throw MDError.tokenError
        case 400..<500:
            throw MDError.clientError
        case 500...:
            throw MDError.serverError
        default:
            return
        }
    }
}
