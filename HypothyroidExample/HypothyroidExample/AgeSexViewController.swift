//
//  AgeSexViewController.swift
//  HypothyroidExample
//
//  Created by Eric Stroh on 2/22/18.
//  Copyright © 2018 Medullan. All rights reserved.
//

import UIKit

class AgeSexViewController: UIViewController {
    
    
    @IBOutlet weak var sexControl: UISegmentedControl!
    @IBOutlet weak var ageTextField: UITextField!
    
    var predictionModel: HypoThyroidPredictionModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if predictionModel == nil {
            predictionModel = HypoThyroidPredictionModel()
        }
        if ViewController.userProvidedData == false {
            guard let predictionModel = predictionModel else {
                return
            }
            sexControl.selectedSegmentIndex = predictionModel.sex == "m" ? 0 : 1
            ageTextField.text = "\(predictionModel.age)"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Enter Personal Info"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ""
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
        predictionModel?.age = Int(Double(ageTextField.text ?? "0") ?? 0.0)
        predictionModel?.sex = sexControl.selectedSegmentIndex == 0 ? "m" : "f"
        let queryVC  = QueryViewController(nibName: "QueryViewController", bundle: Bundle.main)
        queryVC.predictionModel = predictionModel
        navigationController?.pushViewController(queryVC, animated: true)
    }
}
