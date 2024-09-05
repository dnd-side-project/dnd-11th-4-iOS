//
//  API.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 9/4/24.
//

import Foundation
import Alamofire

final class APIManager {
    static let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let apiLogger = APIEventLogger()
        return Session(configuration: configuration, eventMonitors: [apiLogger])
    }()
}
