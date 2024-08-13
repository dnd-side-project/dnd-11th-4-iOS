//
//  HomeMap_강원도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class HomeMap_강원도: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 335.6, y: 290.54))
        shape.addLine(to: CGPoint(x: 282.49, y: 293.91))
        shape.addCurve(to: CGPoint(x: 275.29, y: 292.38), controlPoint1: CGPoint(x: 279.99, y: 294.06), controlPoint2: CGPoint(x: 277.51, y: 293.53))
        shape.addLine(to: CGPoint(x: 269.29, y: 289.24))
        shape.addLine(to: CGPoint(x: 237.3, y: 272.55))
        shape.addCurve(to: CGPoint(x: 224.01, y: 272.91), controlPoint1: CGPoint(x: 233.1, y: 270.37), controlPoint2: CGPoint(x: 228.08, y: 270.5))
        shape.addLine(to: CGPoint(x: 203.26, y: 285.17))
        shape.addCurve(to: CGPoint(x: 195.94, y: 287.07), controlPoint1: CGPoint(x: 201.04, y: 286.48), controlPoint2: CGPoint(x: 198.5, y: 287.13))
        shape.addLine(to: CGPoint(x: 175.76, y: 286.99))
        shape.addLine(to: CGPoint(x: 178.06, y: 285.24))
        shape.addCurve(to: CGPoint(x: 180.74, y: 281.2), controlPoint1: CGPoint(x: 179.38, y: 284.23), controlPoint2: CGPoint(x: 180.32, y: 282.81))
        shape.addLine(to: CGPoint(x: 186.42, y: 259.12))
        shape.addCurve(to: CGPoint(x: 179.26, y: 249.88), controlPoint1: CGPoint(x: 187.62, y: 254.44), controlPoint2: CGPoint(x: 184.09, y: 249.88))
        shape.addCurve(to: CGPoint(x: 166.66, y: 244.61), controlPoint1: CGPoint(x: 170.47, y: 249.88), controlPoint2: CGPoint(x: 167.59, y: 247.74))
        shape.addLine(to: CGPoint(x: 162.03, y: 229.25))
        shape.addCurve(to: CGPoint(x: 162.28, y: 224.29), controlPoint1: CGPoint(x: 161.54, y: 227.62), controlPoint2: CGPoint(x: 161.62, y: 225.86))
        shape.addLine(to: CGPoint(x: 169.5, y: 206.81))
        shape.addCurve(to: CGPoint(x: 166.97, y: 197.97), controlPoint1: CGPoint(x: 170.8, y: 203.63), controlPoint2: CGPoint(x: 169.76, y: 199.97))
        shape.addLine(to: CGPoint(x: 122.3, y: 165.87))
        shape.addLine(to: CGPoint(x: 129.44, y: 156.82))
        shape.addCurve(to: CGPoint(x: 132.45, y: 155.21), controlPoint1: CGPoint(x: 130.18, y: 155.89), controlPoint2: CGPoint(x: 131.26, y: 155.31))
        shape.addLine(to: CGPoint(x: 215.32, y: 148.59))
        shape.addCurve(to: CGPoint(x: 218.96, y: 145.87), controlPoint1: CGPoint(x: 216.96, y: 148.47), controlPoint2: CGPoint(x: 218.37, y: 147.4))
        shape.addLine(to: CGPoint(x: 226.12, y: 127.09))
        shape.addCurve(to: CGPoint(x: 233.69, y: 126.34), controlPoint1: CGPoint(x: 227.37, y: 123.8), controlPoint2: CGPoint(x: 231.84, y: 123.36))
        shape.addLine(to: CGPoint(x: 334.95, y: 288.18))
        shape.addCurve(to: CGPoint(x: 335.6, y: 290.54), controlPoint1: CGPoint(x: 335.4, y: 288.89), controlPoint2: CGPoint(x: 335.62, y: 289.71))
        shape.close()

        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.mapBackground.cgColor
        shapeLayer.fillColor = UIColor.mapGray.cgColor
        shapeLayer.lineWidth = 1.0
        
        self.layer.addSublayer(shapeLayer)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return shape.contains(point)
    }
}
