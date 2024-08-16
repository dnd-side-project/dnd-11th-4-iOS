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
        static let iconCalendar = UIImage(named: "IconCalendar")
        static let iconBack = UIImage(named: "IconBack")
        static let iconDetail = UIImage(named: "IconDetail")
        static let iconForward = UIImage(named: "IconForward")
        static let iconMap = UIImage(named: "IconMap")
        static let iconMapBlack = UIImage(named: "IconMapBlack")
        static let iconMapGray = UIImage(named: "IconMapGray")
        static let iconMyPage = UIImage(named: "IconMyPage")
        static let iconMyPageBlack = UIImage(named: "IconMyPageBlack")
        static let iconMyPageGray = UIImage(named: "IconMyPageGray")
        static let iconPencilBlack = UIImage(named: "IconPencilBlack")
        static let iconPencilGray = UIImage(named: "IconPencilGray")
        static let iconPicture = UIImage(named: "IconPicture")
        static let iconSetting = UIImage(named: "IconSetting")
        static let iconShoes = UIImage(named: "IconShoes")
        static let iconTrashcan = UIImage(named: "IconTrashcan")
        static let iconXCircle = UIImage(named: "IconXCircle")
        static let iconEdit = UIImage(named: "IconEdit")
        static let imageEmpty = UIImage(named: "ImageEmpty")
        static let imageStart = UIImage(named: "ImageStart")
        static let logoBlack = UIImage(named: "LogoBlack")
        static let logoWhite = UIImage(named: "LogoWhite")
    }
}
