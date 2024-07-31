//
//  OnboardingMap_인천.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_인천: UIView, DrawMapProtocol {
    
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
        
        // MARK: - 인천
        
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 131.51, y: 274.27))
        shape.addLine(to: CGPoint(x: 129.98, y: 286.33))
        shape.addCurve(to: CGPoint(x: 128.55, y: 288.5), controlPoint1: CGPoint(x: 129.87, y: 287.24), controlPoint2: CGPoint(x: 129.34, y: 288.04))
        shape.addLine(to: CGPoint(x: 123.69, y: 291.36))
        shape.addLine(to: CGPoint(x: 122.64, y: 290.86))
        shape.addCurve(to: CGPoint(x: 121.13, y: 288.75), controlPoint1: CGPoint(x: 121.8, y: 290.47), controlPoint2: CGPoint(x: 121.24, y: 289.67))
        shape.addLine(to: CGPoint(x: 119.54, y: 274.36))
        shape.addCurve(to: CGPoint(x: 119.06, y: 273.12), controlPoint1: CGPoint(x: 119.48, y: 273.9), controlPoint2: CGPoint(x: 119.31, y: 273.48))
        shape.addLine(to: CGPoint(x: 124.16, y: 269.73))
        shape.addCurve(to: CGPoint(x: 127.32, y: 269.67), controlPoint1: CGPoint(x: 125.11, y: 269.09), controlPoint2: CGPoint(x: 126.34, y: 269.07))
        shape.addLine(to: CGPoint(x: 130.12, y: 271.38))
        shape.addCurve(to: CGPoint(x: 131.51, y: 274.27), controlPoint1: CGPoint(x: 131.11, y: 271.99), controlPoint2: CGPoint(x: 131.65, y: 273.11))
        shape.close()
        
        // MARK: - 영종도
        
        shape.move(to: CGPoint(x: 114.41, y: 282.46))
        shape.addLine(to: CGPoint(x: 110.34, y: 284.56))
        shape.addCurve(to: CGPoint(x: 107.94, y: 284), controlPoint1: CGPoint(x: 109.51, y: 284.99), controlPoint2: CGPoint(x: 108.49, y: 284.75))
        shape.addLine(to: CGPoint(x: 105.93, y: 281.21))
        shape.addCurve(to: CGPoint(x: 106.99, y: 278.26), controlPoint1: CGPoint(x: 105.13, y: 280.13), controlPoint2: CGPoint(x: 105.69, y: 278.59))
        shape.addLine(to: CGPoint(x: 110.32, y: 277.4))
        shape.addCurve(to: CGPoint(x: 111.71, y: 277.59), controlPoint1: CGPoint(x: 110.79, y: 277.29), controlPoint2: CGPoint(x: 111.29, y: 277.35))
        shape.addLine(to: CGPoint(x: 114.45, y: 279.11))
        shape.addCurve(to: CGPoint(x: 114.41, y: 282.46), controlPoint1: CGPoint(x: 115.78, y: 279.85), controlPoint2: CGPoint(x: 115.75, y: 281.76))
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
