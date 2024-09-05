//
//  Enviroment.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 9/5/24.
//

import Foundation

public enum Environment {
    static let baseURL: String = {
        guard let version = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("baseURL typecasting failed")
        }
        return version
    }()
}
