//
//  HomeResponse.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/26/24.
//

import Foundation

struct HomeResponse: Codable {
    let regionName: String
    let regionColor: OpacityColorType
    let colorOpacity: Int
    let totalRegionCount: Int
    let visitedRegionCount: Int
}
