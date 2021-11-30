//
//  AddDataViewController.swift
//  TestTableApp
//
//  Created by user on 23.11.21.
//

import UIKit

class AddDataViewController: UITableViewController{

    @IBOutlet var tableViewSVC: UITableView!

    @IBOutlet weak var inputKey: UITextField!
    @IBOutlet weak var inputValue: UITextField!


    @IBOutlet weak var switchDigits: UISwitch!
    @IBOutlet weak var switchString: UISwitch!
    @IBOutlet weak var switchBool: UISwitch!

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        inputValue.isEnabled = false
    }

    @IBAction func digitsSwitch(_ sender: UISwitch) {
        inputValue.isEnabled = true
        switchString.isOn = false
        switchBool.isOn = false
        segmentedControl.isHidden = true
        inputValue.keyboardType = .decimalPad
    }

    @IBAction func stringSwitch(_ sender: UISwitch) {
        inputValue.isEnabled = true
        switchDigits.isOn = false
        switchBool.isOn = false
        segmentedControl.isHidden = true
        inputValue.keyboardType = .default
    }

    @IBAction func boolSwitch(_ sender: UISwitch) {
        switchString.isOn = false
        switchDigits.isOn = false
        if sender.isOn {
            inputValue.isEnabled = false
            segmentedControl.isHidden = false
        } else {
            segmentedControl.isHidden = true
        }
    }

    @IBAction func saveButton() {
        if segmentedControl.isHidden == false {
            inputValue.text = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
            ViewModel.shared.saveMark(key: inputKey.text!, value: inputValue.text!)
        }
        ViewModel.shared.saveMark(key: inputKey.text!, value: inputValue.text!)
        inputKey.text = ""
        inputValue.text = ""
    }
}
