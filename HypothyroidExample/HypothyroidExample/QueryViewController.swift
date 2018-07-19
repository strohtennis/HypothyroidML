//
//  QueryViewController.swift
//  HypothyroidExample
//
//  Created by Eric Stroh on 2/22/18.
//  Copyright © 2018 Strohtennis. All rights reserved.
//

import UIKit

class QueryViewController: UIViewController {
    
    var predictionModel: HypoThyroidPredictionModel?

    @IBOutlet weak var onThyroxinSwitch: UISwitch!
    @IBOutlet weak var onQueryThyroxinSwitch: UISwitch!
    @IBOutlet weak var onAntithyroidMedsSwitch: UISwitch!
    @IBOutlet weak var onThyroidSurgerySwitch: UISwitch!
    @IBOutlet weak var onQueryHypothyroidSwitch: UISwitch!
    @IBOutlet weak var onQueryHyperthyroidSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !ViewController.userProvidedData {
            guard let predictionModel = predictionModel else {
                return
            }
            onThyroxinSwitch.isOn = predictionModel.on_thyroxine
            onQueryThyroxinSwitch.isOn = predictionModel.query_on_thyroxine
            onAntithyroidMedsSwitch.isOn = predictionModel.on_antithyroid_med
            onThyroidSurgerySwitch.isOn = predictionModel.thyroid_surgery
            onQueryHypothyroidSwitch.isOn = predictionModel.query_hypothyroid
            onQueryHyperthyroidSwitch.isOn = predictionModel.query_hyperthyroid
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Enter Query Info"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ""
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        predictionModel?.on_thyroxine = onThyroxinSwitch.isOn
        predictionModel?.query_on_thyroxine = onQueryThyroxinSwitch.isOn
        predictionModel?.on_antithyroid_med = onAntithyroidMedsSwitch.isOn
        predictionModel?.thyroid_surgery = onThyroidSurgerySwitch.isOn
        predictionModel?.query_hypothyroid = onQueryHypothyroidSwitch.isOn
        predictionModel?.query_hyperthyroid = onQueryHyperthyroidSwitch.isOn
        let statusVC  = StatusViewController(nibName: "StatusViewController", bundle: Bundle.main)
        statusVC.predictionModel = predictionModel
        navigationController?.pushViewController(statusVC, animated: true)
    }
    
}
