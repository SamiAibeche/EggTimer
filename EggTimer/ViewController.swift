//
//  ViewController.swift
//  EggTimer
//
//  Created by Aibeche on 30/11/16.
//  Copyright © 2016 Aibeche. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerInfo:[String] = []
    var tempsCuisson:Int = 0
    
    //Outlets
    @IBOutlet weak var minuteurLabel: UILabel!
    
    @IBOutlet weak var playMinuteurBtn: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    //Action
    @IBAction func resetMinuteurAction(_ sender: UIButton) {
    }
    @IBAction func playMinuteurAction(_ sender: UIButton) {
    }
    
    func selectionCuisson(selector: Int){
        
        switch selector {
        case 0:
            tempsCuisson = 540
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            
            break
            
        case 1:
            tempsCuisson = 180
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        case 2:
            tempsCuisson = 300
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
        case 3:
            tempsCuisson = 220
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
        case 4:
            tempsCuisson = 240
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
        case 5:
            tempsCuisson = 260
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
        default:
            print("Aucune sélection")
            break
            
        }
    }
    
    func minuteurString(temps: Int)->String{
        let heure = Int(temps) / 3600
        let min = Int(temps) / 60 % 60
        let sec = Int(temps) % 60
        
        return String(format: "%02i:%02i:%02i", heure, min, sec)
        
    }
    //MARK - PickerViewDataSource
    
    // returns the number of 'columns' to display.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        
        return 1
    }
    
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return pickerInfo.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Datasource + delegate à la vue
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerInfo = ["Oeufs Durs","Oeuf à la coque", "Oeufs Mollet", "Oeufs Cocotte", "Oeufs Poché", "Omelette Baveuse"]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerInfo[row]
    }
    
    //MARK - PickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectionCuisson(selector: row)
        
    }
    
    
}

