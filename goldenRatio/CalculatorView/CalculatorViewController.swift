//
//  ViewController.swift
//  goldenRatio
//
//  Created by Masakaz Ozaki on 2018/06/21.
//  Copyright © 2018 Masakazu Ozaki. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    @IBOutlet var label: UILabel!
    @IBOutlet var segment: UISegmentedControl!

    var goldenRatio = (1.0 + sqrt(5.0)) / 2
    var equalA = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func segmentControlTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            equalA = true
        case 1:
            equalA = false
        default:
            equalA = true
        }
    }

    @IBAction func calcButtonTapped() {
        if equalA {
            label.text = "b: " + String(calc(x: atof(textField.text)))
        } else {
            label.text = "a: " + String(calc(x: atof(textField.text)))
        }
    }

    func calc(x: Double) -> Double {
        if equalA {
            let y = x * goldenRatio
            return y
        } else {
            let y = x / goldenRatio
            return y
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // ユーザがキーボード以外の場所をタップすると、キーボードを閉じる
        self.view.endEditing(true)
    }
}

extension CalculatorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // return を押すと、キーボードを閉じる
        textField.resignFirstResponder()

        return true
    }
}
