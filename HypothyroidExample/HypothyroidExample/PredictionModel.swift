//
//  PredictionModel.swift
//  HypothyroidExample
//
//  Created by Eric Stroh on 2/22/18.
//  Copyright © 2018 Strohtennis. All rights reserved.
//

import Foundation

struct HypoThyroidPredictionModel {
    var age: Int
    var sex: String
    var on_thyroxine: Bool
    var query_on_thyroxine: Bool
    var on_antithyroid_med: Bool
    var thyroid_surgery: Bool
    var query_hypothyroid: Bool
    var query_hyperthyroid: Bool
    var pregnant: Bool
    var sick: Bool
    var tumor: Bool
    var lithium: Bool
    var goitre: Bool
    var TSH_measured: Bool
    var TSH: Double
    var T3_measured: Bool
    var T3: Double
    var TT4_measured: Bool
    var TT4: Double
    var T4U_measured: Bool
    var T4U: Double
    var FTI_measured: Bool
    var FTI: Double
}

extension Bool {
    func boolToTF() -> String {
        return self ? "t" : "f"
    }
    
    func boolToYN() -> String {
        return self ? "y" : "n"
    }
}

extension HypoThyroidPredictionModel {
    
    init() {
        age = 0
        sex = ""
        on_thyroxine = false
        query_on_thyroxine = false
        on_antithyroid_med = false
        thyroid_surgery = false
        query_hypothyroid = false
        query_hyperthyroid = false
        pregnant = false
        sick = false
        tumor = false
        lithium = false
        goitre = false
        TSH_measured = false
        TSH = 0.0
        T3_measured = false
        T3 = 0.0
        TT4_measured = false
        TT4 = 0.0
        T4U_measured = false
        T4U = 0.0
        FTI_measured = false
        FTI = 0.0
    }
    
    func classifierInput() -> HypoThyroidClassifierInput {
        return HypoThyroidClassifierInput(age: Double(age),
            sex: sex.uppercased(),
            on_thyroxine: on_thyroxine.boolToTF(),
            query_on_thyroxine: query_on_thyroxine.boolToTF(),
            on_antithyroid_med: on_antithyroid_med.boolToTF(),
            thyroid_surgery: thyroid_surgery.boolToTF(),
            query_hypothyroid: query_hypothyroid.boolToTF(),
            query_hyperthyroid: query_hyperthyroid.boolToTF(),
            pregnant: pregnant.boolToTF(),
            sick: sick.boolToTF(),
            tumor: tumor.boolToTF(),
            lithium: lithium.boolToTF(),
            goitre: goitre.boolToTF(),
            TSH_measured: TSH_measured.boolToYN(),
            TSH: TSH,
            T3_measured: T3_measured.boolToYN(),
            T3: T3,
            TT4_measured: TT4_measured.boolToYN(),
            TT4: TT4,
            T4U_measured: T4U_measured.boolToYN(),
            T4U: T4U,
            FTI_measured: FTI_measured.boolToYN(),
            FTI: FTI)
    }
}
