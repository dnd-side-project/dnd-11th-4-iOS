//
//  OnboardingMap_대전.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_대전: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 173.19, y: 353.3))
        shape.addLine(to: CGPoint(x: 170.62, y: 365.6))
        shape.addCurve(to: CGPoint(x: 170.56, y: 366.62), controlPoint1: CGPoint(x: 170.55, y: 365.93), controlPoint2: CGPoint(x: 170.53, y: 366.28))
        shape.addLine(to: CGPoint(x: 168.54, y: 368.32))
        shape.addCurve(to: CGPoint(x: 162.81, y: 368.71), controlPoint1: CGPoint(x: 166.9, y: 369.65), controlPoint2: CGPoint(x: 164.62, y: 369.81))
        shape.addLine(to: CGPoint(x: 160.01, y: 367.01))
        shape.addCurve(to: CGPoint(x: 157.61, y: 362.74), controlPoint1: CGPoint(x: 158.52, y: 366.1), controlPoint2: CGPoint(x: 157.61, y: 364.49))
        shape.addCurve(to: CGPoint(x: 159.6, y: 352.86), controlPoint1: CGPoint(x: 158.23, y: 353.16), controlPoint2: CGPoint(x: 158.93, y: 353.14))
        shape.addLine(to: CGPoint(x: 170.35, y: 348.29))
        shape.addLine(to: CGPoint(x: 172.15, y: 349.98))
        shape.addCurve(to: CGPoint(x: 173.19, y: 353.3), controlPoint1: CGPoint(x: 173.05, y: 350.83), controlPoint2: CGPoint(x: 173.45, y: 352.09))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        self.layer.addSublayer(shapeLayer)
    }
}
