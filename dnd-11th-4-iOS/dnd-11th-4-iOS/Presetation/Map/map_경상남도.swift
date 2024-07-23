//
//  map_경상남도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class map_경상남도: UIView, DrawMapProtocol {
    
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
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 314.85, y: 478.24))
        shape.addLine(to: CGPoint(x: 288.38, y: 501.03))
        shape.addCurve(to: CGPoint(x: 285.4, y: 506.96), controlPoint1: CGPoint(x: 286.63, y: 502.53), controlPoint2: CGPoint(x: 285.56, y: 504.67))
        shape.addLine(to: CGPoint(x: 284.19, y: 524.32))
        shape.addLine(to: CGPoint(x: 255.84, y: 515.39))
        shape.addCurve(to: CGPoint(x: 250.78, y: 517.51), controlPoint1: CGPoint(x: 253.86, y: 514.76), controlPoint2: CGPoint(x: 251.71, y: 515.66))
        shape.addLine(to: CGPoint(x: 241.63, y: 535.43))
        shape.addCurve(to: CGPoint(x: 237.44, y: 537.73), controlPoint1: CGPoint(x: 240.84, y: 536.99), controlPoint2: CGPoint(x: 239.18, y: 537.9))
        shape.addLine(to: CGPoint(x: 215.34, y: 535.6))
        shape.addCurve(to: CGPoint(x: 211.5, y: 531.36), controlPoint1: CGPoint(x: 213.15, y: 535.38), controlPoint2: CGPoint(x: 211.5, y: 533.55))
        shape.addCurve(to: CGPoint(x: 205.81, y: 527.02), controlPoint1: CGPoint(x: 211.5, y: 528.09), controlPoint2: CGPoint(x: 208.58, y: 526.04))
        shape.addLine(to: CGPoint(x: 189.04, y: 533))
        shape.addLine(to: CGPoint(x: 174.87, y: 520.57))
        shape.addCurve(to: CGPoint(x: 171.47, y: 514.2), controlPoint1: CGPoint(x: 173, y: 518.93), controlPoint2: CGPoint(x: 171.8, y: 516.66))
        shape.addLine(to: CGPoint(x: 169.08, y: 496.02))
        shape.addCurve(to: CGPoint(x: 171.97, y: 490.47), controlPoint1: CGPoint(x: 170.83, y: 494.8), controlPoint2: CGPoint(x: 171.97, y: 492.78))
        shape.addCurve(to: CGPoint(x: 174.05, y: 444.88), controlPoint1: CGPoint(x: 171.97, y: 447.92), controlPoint2: CGPoint(x: 172.73, y: 446.16))
        shape.addLine(to: CGPoint(x: 189.67, y: 429.88))
        shape.addCurve(to: CGPoint(x: 193.28, y: 428.07), controlPoint1: CGPoint(x: 190.69, y: 428.9), controlPoint2: CGPoint(x: 191.95, y: 428.29))
        shape.addCurve(to: CGPoint(x: 197.23, y: 428.62), controlPoint1: CGPoint(x: 194.59, y: 427.86), controlPoint2: CGPoint(x: 195.97, y: 428.03))
        shape.addLine(to: CGPoint(x: 219.99, y: 439.26))
        shape.addCurve(to: CGPoint(x: 223.68, y: 443.7), controlPoint1: CGPoint(x: 221.82, y: 440.11), controlPoint2: CGPoint(x: 223.18, y: 441.74))
        shape.addLine(to: CGPoint(x: 227.05, y: 456.75))
        shape.addCurve(to: CGPoint(x: 234.1, y: 461.81), controlPoint1: CGPoint(x: 227.87, y: 459.92), controlPoint2: CGPoint(x: 230.84, y: 462.05))
        shape.addLine(to: CGPoint(x: 240.75, y: 461.32))
        shape.addLine(to: CGPoint(x: 251.36, y: 460.53))
        shape.addLine(to: CGPoint(x: 289.73, y: 457.67))
        shape.addCurve(to: CGPoint(x: 293.48, y: 458.48), controlPoint1: CGPoint(x: 291.06, y: 457.57), controlPoint2: CGPoint(x: 292.36, y: 457.86))
        shape.addCurve(to: CGPoint(x: 296.13, y: 461.09), controlPoint1: CGPoint(x: 294.57, y: 459.07), controlPoint2: CGPoint(x: 295.49, y: 459.97))
        shape.addLine(to: CGPoint(x: 299.5, y: 467.09))
        shape.addCurve(to: CGPoint(x: 301.63, y: 469.4), controlPoint1: CGPoint(x: 300.02, y: 468.02), controlPoint2: CGPoint(x: 300.75, y: 468.81))
        shape.addLine(to: CGPoint(x: 314.85, y: 478.24))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
    }
    
    
}
