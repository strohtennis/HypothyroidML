//
//  BloodWorkViewController.swift
//  HypothyroidExample
//
//  Created by Eric Stroh on 2/22/18.
//  Copyright © 2018 Strohtennis. All rights reserved.
//

import UIKit

class BloodWorkViewController: UIViewController {

    var predictionModel: HypoThyroidPredictionModel?
    
    @IBOutlet weak var tshTextField: UITextField!
    @IBOutlet weak var t3TextField: UITextField!
    @IBOutlet weak var tt4TextField: UITextField!
    @IBOutlet weak var t4uTextField: UITextField!
    @IBOutlet weak var ftiTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !ViewController.userProvidedData {
            guard let predictionModel = predictionModel else {
                return
            }
            tshTextField.text = "\(predictionModel.TSH)"
            t3TextField.text = "\(predictionModel.T3)"
            tt4TextField.text = "\(predictionModel.TT4)"
            t4uTextField.text = "\(predictionModel.T4U)"
            ftiTextField.text = "\(predictionModel.FTI)"
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Enter Bloodwork"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ""
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        predictionModel?.TSH_measured = tshTextField.text != nil
        predictionModel?.TSH = Double(tshTextField.text ?? "0.0") ?? 0.0
        predictionModel?.T3_measured = t3TextField.text != nil
        predictionModel?.T3 = Double(t3TextField.text ?? "0.0") ?? 0.0
        predictionModel?.TT4_measured = tt4TextField.text != nil
        predictionModel?.TT4 = Double(tt4TextField.text ?? "0.0") ?? 0.0
        predictionModel?.T4U_measured = t4uTextField.text != nil
        predictionModel?.T4U = Double(t4uTextField.text ?? "0.0") ?? 0.0
        predictionModel?.FTI_measured = ftiTextField.text != nil
        predictionModel?.FTI = Double(ftiTextField.text ?? "0.0") ?? 0.0
        let resultsVC  = ResultsViewController(nibName: "ResultsViewController", bundle: Bundle.main)
        resultsVC.predictionModel = predictionModel
        navigationController?.pushViewController(resultsVC, animated: true)
    }

}
