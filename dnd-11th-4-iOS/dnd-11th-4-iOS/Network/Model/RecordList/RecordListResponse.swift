//
//  RecordListResponse.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/9/24.
//

import Foundation

struct RecordListResponse: Codable {
    let entireRecordCount: Int
    let records: [Record]
}

struct Record: Codable {
    let id: Int
    let region, attractionName: String
    let memo, visitDate: String?
    let photoUrls: [String]?
}
