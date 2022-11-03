//
//  CanvasView.swift
//  Final_v1
//
//  Created by Nathan Nguyen on 3/16/22.
//

import UIKit

class CanvasView: UIView {
    
    var touchPoints = [CGPoint]()
    
    var color = UIColor.black.cgColor
    
    var lineArray = [[CGPoint]]()
    
    func changeColor(x: Int) {
        if (x == 0) {
            color = UIColor.black.cgColor
        } else if (x == 1) {
            color = UIColor.red.cgColor
        } else if (x == 2) {
            color = UIColor.blue.cgColor
        }
    }
    
    func clearCanvas() {
        lineArray.removeAll()
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        lineArray.forEach { line in
            context.setStrokeColor(color)
            for (index, point) in line.enumerated() {
                if (index == 0) {
                    context.move(to: point)
                } else {
                    context.addLine(to: point)
                }
            }
            context.strokePath()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let p1 = touches.first?.location(in: self) else { return }
        
        guard var currLine = lineArray.popLast() else { return }
        currLine.append(p1)
        lineArray.append(currLine)
        
        setNeedsDisplay()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lineArray.append([CGPoint]())
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if (touch.tapCount == 2) {
                self.backgroundColor = UIColor(cgColor: color)
            }
        }
    }
    
    func handleTouches(_ method: String, touches: Set<UITouch>) {
        touchPoints.removeAll()
        
        for touch in touches {
            let p1 = touch.location(in: self)
            
            touchPoints.append(p1)
        }
        
        setNeedsLayout()
    }

}
