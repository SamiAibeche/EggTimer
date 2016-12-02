//
//  ViewController.swift
//  EggTimer
//
//  Created by Aibeche on 30/11/16.
//  Copyright © 2016 Aibeche. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Déclaration des variables
    var pickerInfo:[String] = []
    var tempsCuisson:Int = 0
    
    var timer:Timer = Timer() //Ajout de la class Timer
    var lecteur:AVAudioPlayer = AVAudioPlayer() //Initialisation du lecteur de musique
    var flag:Bool = false //Flag (Si on est à la fin du timer)
    
    //Outlets
    @IBOutlet weak var minuteurLabel: UILabel!
    @IBOutlet weak var playMinuteurBtn: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //Action
    @IBAction func resetMinuteurAction(_ sender: UIButton) {
        
        //Lancement du "resetCompteur" lors du clic sur "Play"
        resetCompteur()
        
    }
    @IBAction func playMinuteurAction(_ sender: UIButton) {
        
        //Lancement de la fonction "compteur" lors du clic sur "Play"
        compteur()
    }
    
    //Switch Case qui initialise le compteur lorsque le type de cuisson voulu est sélectionné
    func selectionCuisson(selector: Int){
        
        switch selector {
        case 0:
            //Initialisation du compteur en seconde
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
        
        playMinuteurBtn.isEnabled = true
        playMinuteurBtn.alpha = 1
        minuteurLabel.textColor = UIColor.black
    }
    
    func minuteurString(temps: Int)->String{
        let heure = Int(temps) / 3600
        let min = Int(temps) / 60 % 60
        let sec = Int(temps) % 60
        
        return String(format: "%02i:%02i:%02i", heure, min, sec)
        
    }
    
    func compteur (){
        
        if (!flag) {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.incrementer), userInfo: nil, repeats: true)
            timer.fire()
            playMinuteurBtn.setTitle("Pause", for: UIControlState.normal)
            playMinuteurBtn.setTitleColor(UIColor.orange, for: UIControlState.normal)
            flag = true
        } else {
            timer.invalidate()
            playMinuteurBtn.setTitle("Play", for: UIControlState.normal)
            playMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
            flag = false
        }
    }
    func incrementer(){
        
        if(tempsCuisson == 0){
            timer.invalidate()
            minuteurLabel.text = "00:00:00"
            playMinuteurBtn.setTitle("Play", for: UIControlState.normal)
            playMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
            playMinuteurBtn.isEnabled = false
            playMinuteurBtn.alpha = 0.3
            flag = false
            minuteurLabel.textColor = UIColor.green
            lecteur.play()
        } else {
            tempsCuisson -= 1
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            
        }
        
    }
    func resetCompteur(){
        timer.invalidate()
        tempsCuisson = 0
        minuteurLabel.text = "00:00:00"
        playMinuteurBtn.setTitle("Play", for: UIControlState.normal)
        playMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        playMinuteurBtn.isEnabled = false
        playMinuteurBtn.alpha = 0.3
        lecteur.stop()
        minuteurLabel.textColor = UIColor.black
        flag = false
        
        pickerView.selectRow(0, inComponent: 0, animated: true)
        
    }
    
    //Audio Player
    
    func alarm(){
        let song = Bundle.main.path(forResource: "alarm", ofType: "mp3")
        
        do{
        
            try lecteur = AVAudioPlayer(contentsOf: URL(string: song!)!)
        } catch {
            print("Erreur de lecture")
        }
    
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
        
        alarm()
        //Datasource + delegate à la vue
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerInfo = ["Oeufs Durs","Oeuf à la coque", "Oeufs Mollet", "Oeufs Cocotte", "Oeufs Poché", "Omelette Baveuse"]
        
        playMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        
        playMinuteurBtn.isEnabled = false
        playMinuteurBtn.alpha = 0.3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerInfo[row]
    }
    
    //MARK - PickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectionCuisson(selector: row)
        
    }
    
    
}

