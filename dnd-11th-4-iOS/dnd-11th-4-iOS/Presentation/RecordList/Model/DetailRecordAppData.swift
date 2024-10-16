//
//  DetailRecordAppData.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 9/1/24.
//

import UIKit

struct DetailRecordAppData {
    var imageArray: [UIImage]
    var region: String
    let place: String?
    let memo: String?
    let date: String?
    var image: UIImage?
}

extension DetailRecordAppData {
    static let empty = DetailRecordAppData(imageArray: [],
                                           region: "서울", place: "전라남도", memo: nil, date: nil)
}
