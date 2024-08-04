//
//  HomeMap_경기도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class HomeMap_경기도: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 179.26, y: 249.88))
        shape.addCurve(to: CGPoint(x: 166.66, y: 244.61), controlPoint1: CGPoint(x: 170.47, y: 249.88), controlPoint2: CGPoint(x: 167.59, y: 247.74))
        shape.addLine(to: CGPoint(x: 162.03, y: 229.25))
        shape.addCurve(to: CGPoint(x: 162.28, y: 224.29), controlPoint1: CGPoint(x: 161.54, y: 227.62), controlPoint2: CGPoint(x: 161.62, y: 225.86))
        shape.addLine(to: CGPoint(x: 169.5, y: 206.81))
        shape.addCurve(to: CGPoint(x: 166.97, y: 197.97), controlPoint1: CGPoint(x: 170.8, y: 203.63), controlPoint2: CGPoint(x: 169.76, y: 199.97))
        shape.addLine(to: CGPoint(x: 122.3, y: 165.87))
        shape.addLine(to: CGPoint(x: 85.08, y: 213.05))
        shape.addCurve(to: CGPoint(x: 81.33, y: 214.65), controlPoint1: CGPoint(x: 84.18, y: 214.19), controlPoint2: CGPoint(x: 82.77, y: 214.79))
        shape.addLine(to: CGPoint(x: 64.05, y: 213.02))
        shape.addCurve(to: CGPoint(x: 59.41, y: 217.6), controlPoint1: CGPoint(x: 61.41, y: 212.77), controlPoint2: CGPoint(x: 59.19, y: 214.96))
        shape.addLine(to: CGPoint(x: 60.54, y: 231.42))
        shape.addCurve(to: CGPoint(x: 64.78, y: 235.33), controlPoint1: CGPoint(x: 60.72, y: 233.63), controlPoint2: CGPoint(x: 62.56, y: 235.33))
        shape.addCurve(to: CGPoint(x: 75.85, y: 237.11), controlPoint1: CGPoint(x: 73.81, y: 235.33), controlPoint2: CGPoint(x: 75.07, y: 236.02))
        shape.addLine(to: CGPoint(x: 84.08, y: 231.65))
        shape.addCurve(to: CGPoint(x: 89.16, y: 231.55), controlPoint1: CGPoint(x: 85.6, y: 230.63), controlPoint2: CGPoint(x: 87.59, y: 230.6))
        shape.addLine(to: CGPoint(x: 93.69, y: 234.31))
        shape.addCurve(to: CGPoint(x: 95.92, y: 238.96), controlPoint1: CGPoint(x: 95.28, y: 235.29), controlPoint2: CGPoint(x: 96.16, y: 237.1))
        shape.addLine(to: CGPoint(x: 93.46, y: 258.35))
        shape.addCurve(to: CGPoint(x: 91.16, y: 261.85), controlPoint1: CGPoint(x: 93.28, y: 259.82), controlPoint2: CGPoint(x: 92.42, y: 261.1))
        shape.addLine(to: CGPoint(x: 83.32, y: 266.44))
        shape.addLine(to: CGPoint(x: 87.38, y: 268.34))
        shape.addCurve(to: CGPoint(x: 87.89, y: 275.76), controlPoint1: CGPoint(x: 90.41, y: 269.76), controlPoint2: CGPoint(x: 90.69, y: 273.95))
        shape.addLine(to: CGPoint(x: 82.46, y: 279.27))
        shape.addCurve(to: CGPoint(x: 81.44, y: 285.49), controlPoint1: CGPoint(x: 80.35, y: 280.64), controlPoint2: CGPoint(x: 79.88, y: 283.53))
        shape.addLine(to: CGPoint(x: 86.02, y: 291.27))
        shape.addCurve(to: CGPoint(x: 86.57, y: 295.66), controlPoint1: CGPoint(x: 87.1, y: 292.62), controlPoint2: CGPoint(x: 87.18, y: 294.3))
        shape.addLine(to: CGPoint(x: 119.64, y: 303.98))
        shape.addCurve(to: CGPoint(x: 123.71, y: 306.65), controlPoint1: CGPoint(x: 121.26, y: 304.39), controlPoint2: CGPoint(x: 122.7, y: 305.33))
        shape.addLine(to: CGPoint(x: 128.89, y: 313.4))
        shape.addCurve(to: CGPoint(x: 134.55, y: 316.3), controlPoint1: CGPoint(x: 130.3, y: 315.23), controlPoint2: CGPoint(x: 132.4, y: 316.23))
        shape.addCurve(to: CGPoint(x: 139.24, y: 314.79), controlPoint1: CGPoint(x: 136.18, y: 316.34), controlPoint2: CGPoint(x: 137.84, y: 315.85))
        shape.addLine(to: CGPoint(x: 175.76, y: 286.99))
        shape.addLine(to: CGPoint(x: 178.06, y: 285.24))
        shape.addCurve(to: CGPoint(x: 180.74, y: 281.2), controlPoint1: CGPoint(x: 179.38, y: 284.23), controlPoint2: CGPoint(x: 180.32, y: 282.81))
        shape.addLine(to: CGPoint(x: 186.42, y: 259.12))
        shape.addCurve(to: CGPoint(x: 179.26, y: 249.88), controlPoint1: CGPoint(x: 187.62, y: 254.44), controlPoint2: CGPoint(x: 184.09, y: 249.88))
        shape.close()
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
        shape.addLine(to: CGPoint(x: 114.74, y: 227.06))
        shape.addCurve(to: CGPoint(x: 117.14, y: 226.03), controlPoint1: CGPoint(x: 115.37, y: 226.4), controlPoint2: CGPoint(x: 116.23, y: 226.03))
        shape.addCurve(to: CGPoint(x: 129.44, y: 229.35), controlPoint1: CGPoint(x: 127.95, y: 226.03), controlPoint2: CGPoint(x: 129.44, y: 227.51))
        shape.addLine(to: CGPoint(x: 134.61, y: 241.51))
        shape.addCurve(to: CGPoint(x: 134.87, y: 246.61), controlPoint1: CGPoint(x: 136.27, y: 242.75), controlPoint2: CGPoint(x: 136.4, y: 245.2))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.mapBackground.cgColor
        shapeLayer.fillColor = UIColor.mapGray.cgColor
        shapeLayer.lineWidth = 1.0
        
        self.layer.addSublayer(shapeLayer)
    }
}
