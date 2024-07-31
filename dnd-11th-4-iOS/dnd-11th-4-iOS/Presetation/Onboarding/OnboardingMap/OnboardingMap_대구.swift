//
//  OnboardingMap_대구.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_대구: UIView, DrawMapProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        drawMap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        drawMap()
    }
    
    func drawMap() {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 238.66, y: 402.66))
        shape.addLine(to: CGPoint(x: 233.33, y: 403.33))
        shape.addCurve(to: CGPoint(x: 230.81, y: 405.26), controlPoint1: CGPoint(x: 232.21, y: 403.47), controlPoint2: CGPoint(x: 231.24, y: 404.21))
        shape.addLine(to: CGPoint(x: 227.92, y: 412.04))
        shape.addLine(to: CGPoint(x: 221.34, y: 412.54))
        shape.addLine(to: CGPoint(x: 221.19, y: 398.11))
        shape.addCurve(to: CGPoint(x: 222.33, y: 395.67), controlPoint1: CGPoint(x: 221.19, y: 397.16), controlPoint2: CGPoint(x: 221.61, y: 396.28))
        shape.addLine(to: CGPoint(x: 234.66, y: 385.41))
        shape.addCurve(to: CGPoint(x: 239.81, y: 387.42), controlPoint1: CGPoint(x: 236.57, y: 383.83), controlPoint2: CGPoint(x: 239.47, y: 384.96))
        shape.addLine(to: CGPoint(x: 241.4, y: 399.08))
        shape.addCurve(to: CGPoint(x: 238.66, y: 402.66), controlPoint1: CGPoint(x: 241.64, y: 400.83), controlPoint2: CGPoint(x: 240.41, y: 402.44))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        self.layer.addSublayer(shapeLayer)
    }
}
