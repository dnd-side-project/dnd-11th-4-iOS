//
//  map_경상북도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class map_경상북도: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 344.5, y: 414.23))
        shape.addLine(to: CGPoint(x: 335.68, y: 446.18))
        shape.addCurve(to: CGPoint(x: 308.04, y: 448.71), controlPoint1: CGPoint(x: 313.82, y: 446.18), controlPoint2: CGPoint(x: 310.73, y: 447.06))
        shape.addLine(to: CGPoint(x: 293.48, y: 458.48))
        shape.addCurve(to: CGPoint(x: 289.73, y: 457.67), controlPoint1: CGPoint(x: 292.36, y: 457.86), controlPoint2: CGPoint(x: 291.05, y: 457.57))
        shape.addLine(to: CGPoint(x: 251.36, y: 460.53))
        shape.addLine(to: CGPoint(x: 256.02, y: 449.62))
        shape.addCurve(to: CGPoint(x: 260.09, y: 446.51), controlPoint1: CGPoint(x: 256.72, y: 447.92), controlPoint2: CGPoint(x: 258.28, y: 446.74))
        shape.addLine(to: CGPoint(x: 268.68, y: 445.43))
        shape.addCurve(to: CGPoint(x: 273.09, y: 439.68), controlPoint1: CGPoint(x: 271.5, y: 445.08), controlPoint2: CGPoint(x: 273.48, y: 442.5))
        shape.addLine(to: CGPoint(x: 270.53, y: 420.93))
        shape.addCurve(to: CGPoint(x: 262.23, y: 417.69), controlPoint1: CGPoint(x: 269.99, y: 416.97), controlPoint2: CGPoint(x: 265.31, y: 415.14))
        shape.addLine(to: CGPoint(x: 242.35, y: 434.19))
        shape.addCurve(to: CGPoint(x: 240.51, y: 438.12), controlPoint1: CGPoint(x: 241.19, y: 435.17), controlPoint2: CGPoint(x: 240.51, y: 436.6))
        shape.addLine(to: CGPoint(x: 240.75, y: 461.32))
        shape.addLine(to: CGPoint(x: 234.1, y: 461.81))
        shape.addCurve(to: CGPoint(x: 227.05, y: 456.75), controlPoint1: CGPoint(x: 230.84, y: 462.05), controlPoint2: CGPoint(x: 227.87, y: 459.92))
        shape.addLine(to: CGPoint(x: 223.68, y: 443.7))
        shape.addCurve(to: CGPoint(x: 219.99, y: 439.26), controlPoint1: CGPoint(x: 223.18, y: 441.74), controlPoint2: CGPoint(x: 221.82, y: 440.11))
        shape.addLine(to: CGPoint(x: 197.23, y: 428.62))
        shape.addCurve(to: CGPoint(x: 193.28, y: 428.07), controlPoint1: CGPoint(x: 195.97, y: 428.03), controlPoint2: CGPoint(x: 194.59, y: 427.86))
        shape.addLine(to: CGPoint(x: 190.1, y: 410.52))
        shape.addLine(to: CGPoint(x: 198.92, y: 409.12))
        shape.addCurve(to: CGPoint(x: 203.58, y: 404.86), controlPoint1: CGPoint(x: 201.19, y: 408.76), controlPoint2: CGPoint(x: 203.02, y: 407.08))
        shape.addLine(to: CGPoint(x: 207.51, y: 389.12))
        shape.addCurve(to: CGPoint(x: 204.15, y: 382.46), controlPoint1: CGPoint(x: 208.19, y: 386.38), controlPoint2: CGPoint(x: 206.77, y: 383.54))
        shape.addLine(to: CGPoint(x: 198.07, y: 379.92))
        shape.addCurve(to: CGPoint(x: 194.88, y: 372.7), controlPoint1: CGPoint(x: 195.25, y: 378.76), controlPoint2: CGPoint(x: 193.84, y: 375.57))
        shape.addLine(to: CGPoint(x: 202.56, y: 351.46))
        shape.addCurve(to: CGPoint(x: 202.36, y: 347.1), controlPoint1: CGPoint(x: 203.07, y: 350.04), controlPoint2: CGPoint(x: 203, y: 348.47))
        shape.addLine(to: CGPoint(x: 200.84, y: 343.86))
        shape.addCurve(to: CGPoint(x: 203.5, y: 336.31), controlPoint1: CGPoint(x: 199.52, y: 341.04), controlPoint2: CGPoint(x: 200.71, y: 337.69))
        shape.addLine(to: CGPoint(x: 244.23, y: 316.24))
        shape.addCurve(to: CGPoint(x: 245.93, y: 314.96), controlPoint1: CGPoint(x: 244.87, y: 315.92), controlPoint2: CGPoint(x: 245.45, y: 315.5))
        shape.addLine(to: CGPoint(x: 269.29, y: 289.24))
        shape.addLine(to: CGPoint(x: 275.29, y: 292.38))
        shape.addCurve(to: CGPoint(x: 282.49, y: 293.91), controlPoint1: CGPoint(x: 277.51, y: 293.53), controlPoint2: CGPoint(x: 279.99, y: 294.06))
        shape.addLine(to: CGPoint(x: 335.6, y: 290.54))
        shape.addLine(to: CGPoint(x: 332.98, y: 405.1))
        shape.addCurve(to: CGPoint(x: 337.23, y: 409.46), controlPoint1: CGPoint(x: 332.93, y: 407.6), controlPoint2: CGPoint(x: 334.96, y: 409.46))
        shape.addCurve(to: CGPoint(x: 338.82, y: 409.15), controlPoint1: CGPoint(x: 337.75, y: 409.46), controlPoint2: CGPoint(x: 338.29, y: 409.36))
        shape.addCurve(to: CGPoint(x: 344.5, y: 414.23), controlPoint1: CGPoint(x: 342.09, y: 407.84), controlPoint2: CGPoint(x: 345.44, y: 410.85))
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
