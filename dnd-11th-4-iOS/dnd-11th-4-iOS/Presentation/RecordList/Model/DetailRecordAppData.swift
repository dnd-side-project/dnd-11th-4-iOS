//
//  DetailRecordAppData.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 9/1/24.
//

import UIKit

struct DetailRecordAppData {
    var id: Int
    var imageArray: [String]
    var region: String
    let place: String?
    let memo: String?
    let date: String?
    var image: UIImage?
}

extension DetailRecordAppData {
    static let empty = DetailRecordAppData(id: 0, imageArray: [],
                                           region: "서울", place: "전라남도", memo: nil, date: nil)
}
