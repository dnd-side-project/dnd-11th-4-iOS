//
//  HomeMap_충청북도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class HomeMap_충청북도: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 269.29, y: 289.24))
        shape.addLine(to: CGPoint(x: 245.93, y: 314.96))
        shape.addCurve(to: CGPoint(x: 244.23, y: 316.24), controlPoint1: CGPoint(x: 245.45, y: 315.49), controlPoint2: CGPoint(x: 244.87, y: 315.92))
        shape.addLine(to: CGPoint(x: 203.5, y: 336.31))
        shape.addCurve(to: CGPoint(x: 200.84, y: 343.86), controlPoint1: CGPoint(x: 200.71, y: 337.68), controlPoint2: CGPoint(x: 199.52, y: 341.04))
        shape.addLine(to: CGPoint(x: 202.36, y: 347.1))
        shape.addCurve(to: CGPoint(x: 202.56, y: 351.46), controlPoint1: CGPoint(x: 203, y: 348.47), controlPoint2: CGPoint(x: 203.07, y: 350.04))
        shape.addLine(to: CGPoint(x: 194.88, y: 372.7))
        shape.addCurve(to: CGPoint(x: 198.07, y: 379.92), controlPoint1: CGPoint(x: 193.84, y: 375.57), controlPoint2: CGPoint(x: 195.25, y: 378.76))
        shape.addLine(to: CGPoint(x: 204.15, y: 382.46))
        shape.addCurve(to: CGPoint(x: 207.51, y: 389.12), controlPoint1: CGPoint(x: 206.77, y: 383.54), controlPoint2: CGPoint(x: 208.19, y: 386.38))
        shape.addLine(to: CGPoint(x: 203.58, y: 404.85))
        shape.addCurve(to: CGPoint(x: 198.92, y: 409.12), controlPoint1: CGPoint(x: 203.02, y: 407.08), controlPoint2: CGPoint(x: 201.19, y: 408.76))
        shape.addLine(to: CGPoint(x: 190.1, y: 410.52))
        shape.addLine(to: CGPoint(x: 176.03, y: 412.76))
        shape.addCurve(to: CGPoint(x: 172.81, y: 412.34), controlPoint1: CGPoint(x: 174.91, y: 412.94), controlPoint2: CGPoint(x: 173.79, y: 412.78))
        shape.addCurve(to: CGPoint(x: 170.06, y: 409.78), controlPoint1: CGPoint(x: 171.66, y: 411.84), controlPoint2: CGPoint(x: 170.68, y: 410.95))
        shape.addLine(to: CGPoint(x: 159.34, y: 389.42))
        shape.addCurve(to: CGPoint(x: 158.7, y: 387.23), controlPoint1: CGPoint(x: 158.97, y: 388.74), controlPoint2: CGPoint(x: 158.76, y: 387.99))
        shape.addCurve(to: CGPoint(x: 158.8, y: 385.58), controlPoint1: CGPoint(x: 158.65, y: 386.68), controlPoint2: CGPoint(x: 158.68, y: 386.13))
        shape.addLine(to: CGPoint(x: 162.95, y: 365.81))
        shape.addCurve(to: CGPoint(x: 161.27, y: 360.47), controlPoint1: CGPoint(x: 163.36, y: 363.85), controlPoint2: CGPoint(x: 162.72, y: 361.83))
        shape.addLine(to: CGPoint(x: 158.37, y: 357.75))
        shape.addLine(to: CGPoint(x: 145.01, y: 345.21))
        shape.addCurve(to: CGPoint(x: 143.61, y: 343.14), controlPoint1: CGPoint(x: 144.39, y: 344.61), controlPoint2: CGPoint(x: 143.91, y: 343.9))
        shape.addCurve(to: CGPoint(x: 143.83, y: 338.44), controlPoint1: CGPoint(x: 143.02, y: 341.65), controlPoint2: CGPoint(x: 143.07, y: 339.93))
        shape.addLine(to: CGPoint(x: 146.03, y: 334.1))
        shape.addCurve(to: CGPoint(x: 144.26, y: 326.85), controlPoint1: CGPoint(x: 147.32, y: 331.57), controlPoint2: CGPoint(x: 146.56, y: 328.5))
        shape.addLine(to: CGPoint(x: 134.55, y: 316.3))
        shape.addCurve(to: CGPoint(x: 139.24, y: 314.78), controlPoint1: CGPoint(x: 136.18, y: 316.34), controlPoint2: CGPoint(x: 137.84, y: 315.85))
        shape.addLine(to: CGPoint(x: 175.76, y: 286.99))
        shape.addLine(to: CGPoint(x: 195.94, y: 287.07))
        shape.addCurve(to: CGPoint(x: 203.26, y: 285.16), controlPoint1: CGPoint(x: 198.5, y: 287.13), controlPoint2: CGPoint(x: 201.05, y: 286.48))
        shape.addLine(to: CGPoint(x: 224.01, y: 272.91))
        shape.addCurve(to: CGPoint(x: 237.3, y: 272.55), controlPoint1: CGPoint(x: 228.08, y: 270.5), controlPoint2: CGPoint(x: 233.1, y: 270.37))
        shape.addLine(to: CGPoint(x: 269.29, y: 289.24))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        self.layer.addSublayer(shapeLayer)
    }
    
    
}
