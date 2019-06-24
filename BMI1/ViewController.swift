//
//  ViewController.swift
//  BMI1
//
//  Created by Céline Duflo on 24/06/2019.
//  Copyright © 2019 Céline Duflo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var poids: UILabel!
    @IBOutlet weak var taille: UILabel!
    @IBOutlet weak var sliderPoidsStatus: UISlider!
    @IBOutlet weak var sliderTailleStatus: UISlider!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var message: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderPoidsStatus.value = 77.0
        sliderTailleStatus.value = 1.70
        updateBMI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderPoids(_ sender: Any) {
        updatePoids()
        updateBMI()
    }
    @IBAction func sliderTaille(_ sender: Any) {
        updateTaille()
        updateBMI()
    }

    func updatePoids() {
        poids.text = "\(sliderPoidsStatus.value)"
    }
    func updateTaille() {
        taille.text = "\(sliderTailleStatus.value)"
    }
    
    func updateBMI() {
        let t = sliderTailleStatus.value
        let p = sliderPoidsStatus.value
        
        bmi.text = "\(p/(t*t))"
        let bmiVal = p/(t*t)
        updateMessage(bmiVal: bmiVal)
    }
    func updateMessage(bmiVal: Float) {

        switch bmiVal {
        case 0..<18.5:
            message.text = "trop maigre"
            message.backgroundColor = UIColor.gray
        case 18.5..<25 :
            message.text = "ok"
            message.backgroundColor = UIColor.green
        case 25..<30 :
            message.text = "trop gros"
            message.backgroundColor = UIColor.yellow
        case 30..<35 :
            message.text = "obesité severe"
            message.backgroundColor = UIColor.orange
        default:
            message.text = "obesité morbide"
            message.backgroundColor = UIColor.red
        }
    }


}

