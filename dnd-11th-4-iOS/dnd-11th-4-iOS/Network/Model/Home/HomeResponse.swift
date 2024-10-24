//
//  HomeResponse.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/26/24.
//

import Foundation

struct HomeResponse: Decodable {
    let regions: [Region]
    let visitCount, totalCount: Int
    let selectedColor: String
}

struct Region: Decodable {
    let name: String
    let opacity: Int
}
