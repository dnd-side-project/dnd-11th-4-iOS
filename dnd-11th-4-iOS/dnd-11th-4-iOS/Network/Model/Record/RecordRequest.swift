//
//  RecordRequest.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 9/9/24.
//

import UIKit

struct RecordRequest: Encodable {
    let recordRequest: Record
}

struct UpdateRecordRequest: Encodable {
    let updateRecordRequest: Record
}

struct RecordId: Encodable {
    let id: Int
}

struct Record: Encodable {
    let region, attractionName, memo, localDate: String
}

struct RecordPhotos {
    let photos: [UIImage]
}
