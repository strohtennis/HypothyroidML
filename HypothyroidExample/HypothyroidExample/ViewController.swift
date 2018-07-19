//
//  ViewController.swift
//  HypothyroidExample
//
//  Created by Eric Stroh on 2/22/18.
//  Copyright © 2018 Strohtennis. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    static var userProvidedData = false
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Welcome"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ""
    }
    @IBAction func enterDataPressed(_ sender: Any) {
        let ageSexVC  = AgeSexViewController(nibName: "AgeSexViewController", bundle: Bundle.main)
        ViewController.userProvidedData = true
        navigationController?.pushViewController(ageSexVC, animated: true)
    }
    
    @IBAction func usePositivePressed(_ sender: Any) {
        let modelPositive = HypoThyroidPredictionModel(age: 15, sex: "f", on_thyroxine: true, query_on_thyroxine: false, on_antithyroid_med: false, thyroid_surgery: false, query_hypothyroid: false, query_hyperthyroid: false, pregnant: false, sick: false, tumor: false, lithium: false, goitre: false, TSH_measured: true, TSH: 145, T3_measured: true, T3: 1.7, TT4_measured: true, TT4: 19, T4U_measured: true, T4U: 1.13, FTI_measured: true, FTI: 17)
        let ageSexVC  = ResultsViewController(nibName: "ResultsViewController", bundle: Bundle.main)
        ageSexVC.predictionModel = modelPositive
        navigationController?.pushViewController(ageSexVC, animated: true)
    }
    
    @IBAction func useNegativePressed(_ sender: Any) {
        let modelNegative = HypoThyroidPredictionModel(age: 33, sex: "m", on_thyroxine: false, query_on_thyroxine: false, on_antithyroid_med: false, thyroid_surgery: false, query_hypothyroid: false, query_hyperthyroid: false, pregnant: false, sick: false, tumor: false, lithium: false, goitre: false, TSH_measured: true, TSH: 0, T3_measured: true, T3: 1.9, TT4_measured: true, TT4: 97, T4U_measured: true, T4U: 0.9, FTI_measured: true, FTI: 108)
        let ageSexVC  = ResultsViewController(nibName: "ResultsViewController", bundle: Bundle.main)
        ageSexVC.predictionModel = modelNegative
        navigationController?.pushViewController(ageSexVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

