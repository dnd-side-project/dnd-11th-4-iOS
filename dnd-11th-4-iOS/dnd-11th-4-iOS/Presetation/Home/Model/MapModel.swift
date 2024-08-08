//
//  MapModel.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/8/24.
//

import UIKit

/// 전체 map Model (선택된 map, 배열 형태의 전체 map)
struct TotalMapModel {
    var selectedMap: SelectedMapModel?
    var totalMapArray: [MapModel]
}

/// 선택된 map Model
struct SelectedMapModel {
    let selectedMapName: String
    let isHidden: Bool
}

/// 하나의 map Model
struct MapModel {
    let mapName: String
    let mapColor: UIColor
}
