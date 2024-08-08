//
//  HomeMap_대전.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit


final class HomeMap_대전: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 163.13, y: 366.06))
        shape.addLine(to: CGPoint(x: 158.98, y: 385.83))
        shape.addCurve(to: CGPoint(x: 158.88, y: 387.47), controlPoint1: CGPoint(x: 158.86, y: 386.37), controlPoint2: CGPoint(x: 158.83, y: 386.93))
        shape.addLine(to: CGPoint(x: 155.63, y: 390.22))
        shape.addCurve(to: CGPoint(x: 146.4, y: 390.84), controlPoint1: CGPoint(x: 152.99, y: 392.36), controlPoint2: CGPoint(x: 149.3, y: 392.6))
        shape.addLine(to: CGPoint(x: 141.87, y: 388.1))
        shape.addCurve(to: CGPoint(x: 138, y: 381.23), controlPoint1: CGPoint(x: 139.47, y: 386.65), controlPoint2: CGPoint(x: 138, y: 384.04))
        shape.addCurve(to: CGPoint(x: 137.21, y: 365.35), controlPoint1: CGPoint(x: 137.01, y: 365.83), controlPoint2: CGPoint(x: 137.14, y: 365.8))
        shape.addLine(to: CGPoint(x: 158.55, y: 358))
        shape.addLine(to: CGPoint(x: 161.45, y: 360.71))
        shape.addCurve(to: CGPoint(x: 163.13, y: 366.06), controlPoint1: CGPoint(x: 162.9, y: 362.08), controlPoint2: CGPoint(x: 163.54, y: 364.1))
        shape.close()
        
        // CAShapeLayer 설정
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.mapBackground.cgColor
        shapeLayer.fillColor = UIColor.mapGray.cgColor
        shapeLayer.lineWidth = 1.0
        
        // CAShapeLayer를 뷰에 추가
        self.layer.addSublayer(shapeLayer)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return shape.contains(point)
    }
}
