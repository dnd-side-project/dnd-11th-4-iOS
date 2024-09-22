//
//  MapDeviceInset.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/11/24.
//

import Foundation

struct DeviceSize {
    let width: CGFloat
    let height: CGFloat
}

struct TopAndLeadingInset {
    let top: CGFloat
    let leading: CGFloat
}

enum MapDeviceInset {
    /// 14, 15 Pro Max, 15 Plus
    case width430Height932
    /// 12 Pro Max, 13 Pro Max 14 plus
    case width428Height926
    /// XR, XS Max 11, 11 Pro Max
    case width414Height896
    /// 14, 15 Pro, 15
    case width393Height852
    /// 12, 12 Pro, 13, 13 Pro, 14
    case width390Height844
    /// X, XS, 11 Pro, 12 mini, 13 mini
    case width375Height812
    /// SE 2rd, 3rd
    case width375Height667
    /// opthDevice
    case otherDevice
    
    var inset: TopAndLeadingInset {
        switch self {
        case .width430Height932:
            return TopAndLeadingInset(top: 55, leading: 30)
        case .width428Height926:
            return TopAndLeadingInset(top: 49, leading: 28)
        case .width414Height896:
            return TopAndLeadingInset(top: 35, leading: 20)
        case .width393Height852:
            return TopAndLeadingInset(top: 10, leading: 10)
        case .width390Height844:
            return TopAndLeadingInset(top: 0, leading: 8)
        case .width375Height812:
            return TopAndLeadingInset(top: 0, leading: 0)
        case .width375Height667:
            return TopAndLeadingInset(top: -50, leading: 0)
        case .otherDevice:
            return TopAndLeadingInset(top: 0, leading: 0)
        }
    }
    
    static func deviceInset(size: DeviceSize) -> TopAndLeadingInset {
        switch (size.width, size.height) {
        case (430, 932):
            return MapDeviceInset.width430Height932.inset
        case (428, 926):
            return MapDeviceInset.width428Height926.inset
        case (414, 896):
            return MapDeviceInset.width414Height896.inset
        case (393, 852):
            return MapDeviceInset.width393Height852.inset
        case (390, 844):
            return MapDeviceInset.width390Height844.inset
        case (375, 812):
            return MapDeviceInset.width375Height812.inset
        case (375, 667):
            return MapDeviceInset.width375Height667.inset
        default:
            return MapDeviceInset.otherDevice.inset
        }
    }
}
