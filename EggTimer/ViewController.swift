//
//  ViewController.swift
//  EggTimer
//
//  Created by Aibeche on 30/11/16.
//  Copyright © 2016 Aibeche. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var minuteurLabel: UILabel!
    
    @IBOutlet weak var playMinuteurBtn: UIButton!

    @IBOutlet weak var pickerView: UIPickerView!
    
    //Action
    @IBAction func resetMinuteurAction(_ sender: UIButton) {
    }
    @IBAction func playMinuteurAction(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

