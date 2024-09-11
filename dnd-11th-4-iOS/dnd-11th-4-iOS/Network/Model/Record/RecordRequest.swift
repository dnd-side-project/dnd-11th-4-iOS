//
//  RecordRequest.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/9/24.
//

import Foundation

struct RecordRequest: Encodable {
    let photos: [String]?
    let recordRequest: Record
}

struct UpdateRecordRequest: Encodable {
    let photos: [String]?
    let updateRecordRequest: Record
}

struct RecordId: Encodable {
    let id: Int
}

struct Record: Encodable {
    let region, attractionName: String
    let memo, localDate: String?
}
