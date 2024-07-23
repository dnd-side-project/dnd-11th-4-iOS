//
//  map_서울.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class map_서울: UIView {
    
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
        shape.move(to: CGPoint(x: 134.87, y: 246.61))
        shape.addLine(to: CGPoint(x: 127.21, y: 253.67))
        shape.addCurve(to: CGPoint(x: 123.27, y: 254.08), controlPoint1: CGPoint(x: 126.13, y: 254.66), controlPoint2: CGPoint(x: 124.53, y: 254.83))
        shape.addLine(to: CGPoint(x: 117.82, y: 250.85))
        shape.addCurve(to: CGPoint(x: 114.52, y: 250.8), controlPoint1: CGPoint(x: 116.81, y: 250.25), controlPoint2: CGPoint(x: 115.55, y: 250.23))
        shape.addLine(to: CGPoint(x: 110.09, y: 253.25))
        shape.addCurve(to: CGPoint(x: 105.27, y: 251.17), controlPoint1: CGPoint(x: 108.19, y: 254.31), controlPoint2: CGPoint(x: 105.8, y: 253.28))
        shape.addLine(to: CGPoint(x: 102.61, y: 240.74))
        shape.addCurve(to: CGPoint(x: 104.88, y: 236.74), controlPoint1: CGPoint(x: 102.18, y: 239.01), controlPoint2: CGPoint(x: 103.18, y: 237.25))
        shape.addCurve(to: CGPoint(x: 106.33, y: 235.85), controlPoint1: CGPoint(x: 105.44, y: 236.58), controlPoint2: CGPoint(x: 105.94, y: 236.27))
        shape.addLine(to: CGPoint(x: 114.74, y: 227.05))
        shape.addCurve(to: CGPoint(x: 117.14, y: 226.03), controlPoint1: CGPoint(x: 115.37, y: 226.4), controlPoint2: CGPoint(x: 116.23, y: 226.03))
        shape.addCurve(to: CGPoint(x: 129.44, y: 229.35), controlPoint1: CGPoint(x: 127.95, y: 226.03), controlPoint2: CGPoint(x: 129.44, y: 227.51))
        shape.addLine(to: CGPoint(x: 134.61, y: 241.51))
        shape.addCurve(to: CGPoint(x: 134.87, y: 246.61), controlPoint1: CGPoint(x: 136.27, y: 242.75), controlPoint2: CGPoint(x: 136.4, y: 245.2))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
    }
    
    
}
