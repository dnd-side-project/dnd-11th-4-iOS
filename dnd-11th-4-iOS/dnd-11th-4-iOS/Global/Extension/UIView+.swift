//
//  UIView+.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
