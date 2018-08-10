//
//  LocationTextField.swift
//  DoctorSearch
//
//  Created by Rijo George on 8/10/18.
//  Copyright © 2018 Rijo George. All rights reserved.
//

import UIKit

@IBDesignable
class LocationTextField : UITextField {
    @IBInspectable var leftImage : UIImage? {
        didSet{
            updateView()
        }
    }
   
    @IBInspectable var leftPadding : CGFloat = 0 {
        didSet{
            updateView()
        }
    }
    
    func updateView() {
        layer.borderColor = UIColor(red: 157/255, green: 211/255, blue: 209/255, alpha: 1).cgColor
        layer.borderWidth = CGFloat(Float(2.0))
        layer.cornerRadius = CGFloat(Float(8.0))
        if let image = leftImage {
            leftViewMode = .always
            let imageView = UIImageView(frame : CGRect(x: leftPadding, y: 0, width: 10, height: 16))
            imageView.image = image
            let width = 10+leftPadding
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 16))
            view.addSubview(imageView)
            leftView = view
        } else {
            leftViewMode = .never
        }
    }
    
}
