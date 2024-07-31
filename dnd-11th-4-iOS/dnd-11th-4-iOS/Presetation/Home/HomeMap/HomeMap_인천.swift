//
//  HomeMap_인천.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class HomeMap_인천: UIView, DrawMapProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
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
        shape.move(to: CGPoint(x: 95.92, y: 238.96))
        shape.addLine(to: CGPoint(x: 93.46, y: 258.35))
        shape.addCurve(to: CGPoint(x: 91.16, y: 261.85), controlPoint1: CGPoint(x: 93.28, y: 259.82), controlPoint2: CGPoint(x: 92.42, y: 261.1))
        shape.addLine(to: CGPoint(x: 83.32, y: 266.44))
        shape.addLine(to: CGPoint(x: 81.62, y: 265.63))
        shape.addCurve(to: CGPoint(x: 79.19, y: 262.25), controlPoint1: CGPoint(x: 80.27, y: 265.01), controlPoint2: CGPoint(x: 79.36, y: 263.72))
        shape.addLine(to: CGPoint(x: 76.62, y: 239.11))
        shape.addCurve(to: CGPoint(x: 75.85, y: 237.11), controlPoint1: CGPoint(x: 76.54, y: 238.36), controlPoint2: CGPoint(x: 76.26, y: 237.68))
        shape.addLine(to: CGPoint(x: 84.08, y: 231.65))
        shape.addCurve(to: CGPoint(x: 89.16, y: 231.55), controlPoint1: CGPoint(x: 85.6, y: 230.63), controlPoint2: CGPoint(x: 87.59, y: 230.6))
        shape.addLine(to: CGPoint(x: 93.69, y: 234.31))
        shape.addCurve(to: CGPoint(x: 95.92, y: 238.96), controlPoint1: CGPoint(x: 95.28, y: 235.29), controlPoint2: CGPoint(x: 96.16, y: 237.1))
        shape.close()
        
        // MARK: - 영종도

        shape.move(to: CGPoint(x: 68.35, y: 252.12))
        shape.addLine(to: CGPoint(x: 61.8, y: 255.51))
        shape.addCurve(to: CGPoint(x: 57.92, y: 254.6), controlPoint1: CGPoint(x: 60.45, y: 256.2), controlPoint2: CGPoint(x: 58.81, y: 255.82))
        shape.addLine(to: CGPoint(x: 54.68, y: 250.13))
        shape.addCurve(to: CGPoint(x: 56.39, y: 245.38), controlPoint1: CGPoint(x: 53.4, y: 248.38), controlPoint2: CGPoint(x: 54.29, y: 245.9))
        shape.addLine(to: CGPoint(x: 61.77, y: 244))
        shape.addCurve(to: CGPoint(x: 64.01, y: 244.29), controlPoint1: CGPoint(x: 62.52, y: 243.81), controlPoint2: CGPoint(x: 63.33, y: 243.91))
        shape.addLine(to: CGPoint(x: 68.42, y: 246.74))
        shape.addCurve(to: CGPoint(x: 68.35, y: 252.12), controlPoint1: CGPoint(x: 70.56, y: 247.93), controlPoint2: CGPoint(x: 70.51, y: 251))
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
