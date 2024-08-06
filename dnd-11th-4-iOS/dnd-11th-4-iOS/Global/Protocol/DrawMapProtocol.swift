//
//  DrawMapProtocol.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

struct MapUIModel {
    let backgroundColor: UIColor
    let opacity: Int
}

protocol DrawMapProtocol: AnyObject {
    func drawMap()
    func setBackgrundColor()
    func bindMapUI(color: UIColor)
}

extension DrawMapProtocol where Self: UIView {
    func setBackgrundColor() {
        self.backgroundColor = .mapGray
    }
    func bindMapUI(color: UIColor) {
        self.backgroundColor = color
    }
}
