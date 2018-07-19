//
//  ResultsViewController.swift
//  HypothyroidExample
//
//  Created by Eric Stroh on 2/22/18.
//  Copyright © 2018 Medullan. All rights reserved.
//

import UIKit
import CoreML

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!

    var predictionModel: HypoThyroidPredictionModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Results"
        guard let predictionModel = predictionModel else {
            return
        }
        let mlModel = HypoThyroidClassifier()
        guard let prediction = try? mlModel.prediction(input: predictionModel.classifierInput())  else {
            NSLog("Handle Error")
            return
        }
        
        let diagnosis = prediction.diagnosis
        var pct: Double = 0.0
        if diagnosis == "hypothyroid" {
            pct = prediction.diagnosisProbability["hypothyroid"] ?? 0.0
        } else {
            pct = prediction.diagnosisProbability["negative"] ?? 0.0
        }
        let percent = String(format: "%.0f%%", pct * 100)
        
        resultLabel.text = "Based on previoius patient data, the diagnosis for this patient is: \(diagnosis) \n\nThe confidence of this prediction is " +
        "\(percent)"

    }
    @IBAction func homeTouched(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
