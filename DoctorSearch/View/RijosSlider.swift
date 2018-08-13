//
//  RijosSlider.swift
//  DoctorSearch
//
//  Created by Rijo George on 8/10/18.
//  Copyright © 2018 Rijo George. All rights reserved.
//

import UIKit

@IBDesignable
class RijosSlider: UIView {
    @IBInspectable var trackHight : CGFloat = 2 {
        didSet{
            initView()
        }
    }
    @IBInspectable var progressColor : UIColor = UIColor.blue {
        didSet{
            initView()
        }
    }
    @IBInspectable var remainingColor : UIColor = UIColor.black {
        didSet{
            initView()
        }
    }
    @IBInspectable var thumbSize : CGFloat = 9 {
        didSet{
            initView()
        }
    }
    @IBInspectable var thumbColor : UIColor = UIColor.red {
        didSet{
            initView()
        }
    }
    @IBInspectable var progressTextSize : CGFloat = 10 {
        didSet{
            initView()
        }
    }
    @IBInspectable var progressTextColor : UIColor? {
        didSet{
            initView()
        }
    }
    
    @IBInspectable var value : Int = 50 {
        didSet{
            initView()
        }
    }
    @IBInspectable var min : Double = 1 {
        didSet{
            initView()
        }
    }
    @IBInspectable var max : Double = 100 {
        didSet{
            initView()
        }
    }
    @IBInspectable var appendText : String = "miles" {
        didSet{
            initView()
        }
    }
    var total : Double = 100
    var progressPercent = 0.5
    var thumbx : CGPoint?
    var valueStr = "50 miles"
    
    func initView() {
        self.total = max - min
        self.progressPercent = (Double)(value) / total
        valueStr = "\(value) \(appendText)"
    }
    
    
    override func draw(_ rect: CGRect) {
        
        thumbx = CGPoint(x: bounds.width * CGFloat(progressPercent), y: bounds.height - (thumbSize/2))
        //draw progress line
        let trackPath = UIBezierPath()
        trackPath.lineWidth = trackHight
        trackPath.move(to: CGPoint(x: 0, y: bounds.height - (thumbSize/2)))
        trackPath.addLine(to: thumbx!)
        progressColor.setStroke()
        trackPath.stroke()
        //draw remainingLine
        let trackPathRem = UIBezierPath()
        trackPathRem.lineWidth = trackHight
        trackPathRem.move(to: thumbx!)
        trackPathRem.addLine(to: CGPoint(x: bounds.width, y: bounds.height - (thumbSize/2)))
        remainingColor.setStroke()
        trackPathRem.stroke()
        //draw thumb
        //let thumbPath = UIBezierPath(ovalIn: CGRect(x: (bounds.width * CGFloat(progressPercent)) - (thumbSize/2), y: 0, width: 10, height: 10))
        let thumbPath = UIBezierPath(ovalIn: CGRect(x: (bounds.width * CGFloat(progressPercent)) - (thumbSize/2), y: bounds.height-(thumbSize), width: thumbSize, height: thumbSize))
        thumbColor.setFill()
        thumbPath.fill()
        //draw progress text
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let attributes = [
            NSAttributedStringKey.paragraphStyle: paragraphStyle,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12.0),
            NSAttributedStringKey.foregroundColor: UIColor.blue
        ]
        let attributedString = NSAttributedString(string: valueStr, attributes: attributes)
        let stringSize = valueStr.size(withAttributes: attributes)
        let stringRect = CGRect(x: (thumbx?.x)! - (stringSize.width/2), y: (bounds.height - thumbSize) - stringSize.height, width: stringSize.width, height: stringSize.height)
        attributedString.draw(in: stringRect)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        refreshDraw(touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        refreshDraw(touches)
    }
    
    func refreshDraw(_ touches: Set<UITouch>) {
        let touch = touches.first!
        let location : CGPoint = touch.location(in: self)
        let windowSize = self.layer.preferredFrameSize()
        let width = windowSize.width
        progressPercent = Double(location.x / width)
        value = Int (total * progressPercent )
        setNeedsDisplay()
    }
    

}
