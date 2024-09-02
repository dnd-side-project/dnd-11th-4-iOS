//
//  DetailRecordAppData.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 9/1/24.
//

import UIKit

struct DetailRecordAppData {
    var imageArray: [UIImage]
    let region: String
    let place: String?
    let memo: String?
    let date: String?
}

extension DetailRecordAppData {
    static let empty = DetailRecordAppData(imageArray: [Constant.Image.imageDetailEmpty!],
                                           region: "서울", place: nil, memo: nil, date: nil)
}
