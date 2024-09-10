//
//  RecordListResponse.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/9/24.
//

import Foundation

struct RecordListResponse: Decodable {
    let entireRecordCount: Int
    let id: Int
    let region, attractionName: String
    let memo, visitDate: String?
    let photoUrls: [String]?
}