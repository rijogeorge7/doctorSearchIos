//
//  SearchTextField.swift
//  DoctorSearch
//
//  Created by Rijo George on 8/10/18.
//  Copyright © 2018 Rijo George. All rights reserved.
//

import UIKit

class SearchTextField: UITextField {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.borderColor = UIColor(red: 157/255, green: 211/255, blue: 209/255, alpha: 1).cgColor
        self.layer.borderWidth = CGFloat(Float(2.0))
        self.layer.cornerRadius = CGFloat(Float(8.0))
    }
}
