//
//  ViewController.swift
//  DoctorSearch
//
//  Created by Rijo George on 8/5/18.
//  Copyright © 2018 Rijo George. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var locatinField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locatinField.layer.borderColor = UIColor(red: 157/255, green: 211/255, blue: 209/255, alpha: 1).cgColor
        self.locatinField.layer.borderWidth = CGFloat(Float(2.0))
        self.locatinField.layer.cornerRadius = CGFloat(Float(8.0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        var s : UISlider
    }


}

