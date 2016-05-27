//
//  DieView.swift
//  Dice
//
//  Created by Randall Mardus on 5/26/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import Cocoa

class DieView: NSView {
    
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
        let (edgeLength, dieFrame) = metricsForSize(size)
        let cornerRadius: CGFloat = edgeLength/5.0
        
        //Draw the rounded shape of the die profile:
        NSColor.whiteColor().set()
        NSBezierPath(roundedRect: dieFrame, xRadius: cornerRadius, yRadius: cornerRadius).fill()
    }
    
    
    
}

