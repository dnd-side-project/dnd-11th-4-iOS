//
//  Constant.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

struct Constant { }

extension Constant {
    struct Screen {
        static let width = UIScreen.main.bounds.width
        static let height = UIScreen.main.bounds.height
    }
    
    enum Image {
        static let iconCalendar = UIImage(named: "iconCalendar")
        static let iconBack = UIImage(named: "iconBack")
        static let iconDetail = UIImage(named: "iconDetail")
        static let iconForward = UIImage(named: "iconForward")
        static let iconMap = UIImage(named: "iconMap")
        static let iconMapBlack = UIImage(named: "iconMapBlack")
        static let iconMapGray = UIImage(named: "iconMapGray")
        static let iconMyPage = UIImage(named: "iconMyPage")
        static let iconMyPageBlack = UIImage(named: "iconMyPageBlack")
        static let iconMyPageGray = UIImage(named: "iconMyPageGray")
        static let iconPencilBlack = UIImage(named: "iconPencilBlack")
        static let iconPencilGray = UIImage(named: "iconPencilGray")
        static let iconPicture = UIImage(named: "iconPicture")
        static let iconSetting = UIImage(named: "iconSetting")
        static let iconShoes = UIImage(named: "iconShoes")
        static let iconTrashcan = UIImage(named: "iconTrashcan")
        static let iconXCircle = UIImage(named: "iconXCircle")
    }
}
