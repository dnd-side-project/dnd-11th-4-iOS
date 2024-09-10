//
//  RecordRequest.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/9/24.
//

import Foundation

struct RecordRequest: Encodable {
    let region, attractionName: String
    let memo, localDate: String?
    let photos: [String]?
}
