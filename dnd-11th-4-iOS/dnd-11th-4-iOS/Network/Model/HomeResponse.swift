//
//  HomeResponse.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/26/24.
//

import Foundation

//struct HomeResponse: Codable {
//    let regionName: String
//    let regionColor: OpacityColorType
//    let colorOpacity: Int
//    let totalRegionCount: Int
//    let visitedRegionCount: Int
//}

struct UpdateResponse: Codable {
    let success: Bool
    let message: String
    let data: UpdateResponse2
}

struct UpdateResponse2: Codable {
    let title, content: String
    let iosVersion: iOSVersion
}

struct iOSVersion: Codable {
    let version, forceVersion: String
}

struct UpdateTextModel {
    let title, content: String
}
