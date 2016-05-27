//
//  DieView.swift
//  Dice
//
//  Created by Randall Mardus on 5/26/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import Cocoa

class DieView: NSView {
    
    var intValue: Int? = 5 {
        didSet {
            needsDisplay = true
        }
    }
    
    override func drawRect(dirtyRect: NSRect) {
        let backgroundColor = NSColor.lightGrayColor()
        backgroundColor.set()
        NSBezierPath.fillRect(bounds)
        drawDieWithSize(bounds.size)
    }
    
    func metricsForSize(size: CGSize) -> (edgeLength: CGFloat, dieFrame: CGRect) {
        let edgeLength = min(size.width, size.height)
        let padding = edgeLength/10.0
        let drawingBounds = CGRect(x: 0, y: 0, width: edgeLength, height: edgeLength)
        let dieFrame = drawingBounds.insetBy(dx: padding, dy: padding)
        return (edgeLength, dieFrame)
    }
    
    func drawDieWithSize(size: CGSize) {
        
        if let intValue = intValue {
            let (edgeLength, dieFrame) = metricsForSize(size)
            let cornerRadius: CGFloat = edgeLength/5.0
            let dotRadius = edgeLength/12.0
            let dotFrame = dieFrame.insetBy(dx: dotRadius * 2.5, dy: dotRadius * 2.5)
            
            //Draw the rounded shape of the die profile:
            NSColor.whiteColor().set()
            NSBezierPath(roundedRect: dieFrame, xRadius: cornerRadius, yRadius: cornerRadius).fill()
            
            //ready to draw the dots.
            //The dots will be black:
            NSColor.blackColor().set()
            
            //Nested function to make drawing dots cleaner:
            func drawDot(u: CGFloat, v: CGFloat) {
                let dotOrigin = CGPoint(x: dotFrame.minX + dotFrame.width * u, y: dotFrame.minY + dotFrame.height * v)
                let dotRect = CGRect(origin: dotOrigin, size: CGSizeZero).insetBy(dx: -dotRadius, dy: -dotRadius)
                NSBezierPath(ovalInRect: dotRect).fill()
            }
            
            //If intValue is in range...
            if (1...6).indexOf(intValue) != nil {
                //Draw the dots:
                if [1,3,5].indexOf(intValue) != nil {
                    drawDot(0.5, v: 0.5) //center dot
                }
                if (2...6).indexOf(intValue) != nil {
                    drawDot(0, v: 1) //upper left
                    drawDot(1, v: 0) //lower right
                }
                if (4...6).indexOf(intValue) != nil {
                    drawDot(1, v: 1) //upper right
                    drawDot(0, v: 0) //lower left
                }
                if intValue == 6 {
                    drawDot(0, v: 0.5) //Mid left/right
                    drawDot(1, v: 0.5)
                }
            }
        }
    }
}

