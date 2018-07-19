//
//  StatusViewController.swift
//  HypothyroidExample
//
//  Created by Eric Stroh on 2/22/18.
//  Copyright © 2018 Strohtennis. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {
    
    @IBOutlet weak var pregnantSwitch: UISwitch!
    @IBOutlet weak var sickSwitch: UISwitch!
    @IBOutlet weak var tumorSwitch: UISwitch!
    @IBOutlet weak var lithiumSwitch: UISwitch!
    @IBOutlet weak var goitreSwitch: UISwitch!
    
    var predictionModel: HypoThyroidPredictionModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !ViewController.userProvidedData {
            guard let predictionModel = predictionModel else {
                return
            }
            pregnantSwitch.isOn = predictionModel.pregnant
            sickSwitch.isOn = predictionModel.sick
            tumorSwitch.isOn = predictionModel.tumor
            lithiumSwitch.isOn = predictionModel.lithium
            goitreSwitch.isOn = predictionModel.goitre
                
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Enter Status"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ""
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        predictionModel?.pregnant = pregnantSwitch.isOn
        predictionModel?.sick = sickSwitch.isOn
        predictionModel?.tumor = tumorSwitch.isOn
        predictionModel?.lithium = lithiumSwitch.isOn
        predictionModel?.goitre = goitreSwitch.isOn
        let bloodVC  = BloodWorkViewController(nibName: "BloodWorkViewController", bundle: Bundle.main)
        bloodVC.predictionModel = predictionModel
        navigationController?.pushViewController(bloodVC, animated: true)
    }

}
