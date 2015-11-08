//
//  CheckMarkRecognizer.swift
//  CheckMarkRecognizer
//
//  Created by LAURA LUCRECIA SANCHEZ PADILLA on 22/10/15.
//  Copyright © 2015 LAURA LUCRECIA SANCHEZ PADILLA. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

class CheckMarkRecognizer: UIGestureRecognizer {
    private let minimumCheckMarkAngle = CGFloat(50)
    private let maximumCheckMArkAngle = CGFloat(135)
    private let minimimCheckMarkLength = CGFloat(10)
    private var lastPreviousPoint = CGPointZero
    private var lastCurrentPoint = CGPointZero
    private var lineLengthSoFar = CGFloat(10)
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        let touch = touches.first
        let point = touch?.locationInView(view)
        lastPreviousPoint = point!
        lastCurrentPoint = point!
        lineLengthSoFar = 0
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        let touch = touches.first
        let previousPoint = touch?.previousLocationInView(view)
        let currentPoint = touch?.locationInView(view)
        let angle = angleBetweenLines(lastPreviousPoint, line1End: previousPoint!, line2Start: previousPoint!, line2End: currentPoint!)
        if angle >= minimumCheckMarkAngle && angle <= maximumCheckMArkAngle && lineLengthSoFar > minimimCheckMarkLength{
            state = .Ended
        }
        
        lineLengthSoFar += distanceBetweenPoints(previousPoint!, second: currentPoint!)
        lastPreviousPoint = previousPoint!
        lastCurrentPoint = currentPoint!
    }
}
