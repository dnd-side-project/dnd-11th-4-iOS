//
//  HomeMap_대구.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class HomeMap_대구: UIView, DrawMapProtocol {
    
    var shape = UIBezierPath()
    var shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        drawMap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawMap() {
        // 지도 모양 정의
        shape.move(to: CGPoint(x: 268.68, y: 445.43))
        shape.addLine(to: CGPoint(x: 260.09, y: 446.51))
        shape.addCurve(to: CGPoint(x: 256.02, y: 449.62), controlPoint1: CGPoint(x: 258.28, y: 446.74), controlPoint2: CGPoint(x: 256.72, y: 447.92))
        shape.addLine(to: CGPoint(x: 251.36, y: 460.53))
        shape.addLine(to: CGPoint(x: 240.75, y: 461.32))
        shape.addLine(to: CGPoint(x: 240.51, y: 438.12))
        shape.addCurve(to: CGPoint(x: 242.35, y: 434.19), controlPoint1: CGPoint(x: 240.51, y: 436.6), controlPoint2: CGPoint(x: 241.19, y: 435.17))
        shape.addLine(to: CGPoint(x: 262.23, y: 417.69))
        shape.addCurve(to: CGPoint(x: 270.53, y: 420.93), controlPoint1: CGPoint(x: 265.31, y: 415.14), controlPoint2: CGPoint(x: 269.99, y: 416.97))
        shape.addLine(to: CGPoint(x: 273.09, y: 439.68))
        shape.addCurve(to: CGPoint(x: 268.68, y: 445.43), controlPoint1: CGPoint(x: 273.48, y: 442.5), controlPoint2: CGPoint(x: 271.5, y: 445.08))
        shape.close()
        
        // CAShapeLayer 설정
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.mapBackground.cgColor // 선 색상
        shapeLayer.fillColor = UIColor.mapGray.cgColor // 채우기 색상
        shapeLayer.lineWidth = 1.0
        
        // CAShapeLayer를 뷰에 추가
        self.layer.addSublayer(shapeLayer)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return shape.contains(point)
    }
}
