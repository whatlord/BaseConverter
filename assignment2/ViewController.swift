//
//  ViewController.swift
//  assignment2
//
//  Created by Andrew Jenkins on 10/3/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var values = ["Display in Binary",
                  "Display in Octal",
                  "Display in Decimal",
                  "Display in Hex",
                  "Display in all four bases"]
    var number = 0;
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return values[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedRow = row
        switch(row){
        case 1:
            binaryLabel.isHidden = true
            octalLabel.isHidden = false
            decimalLabel.isHidden = true
            hexaLabel.isHidden = true
        case 2:
            binaryLabel.isHidden = true
            octalLabel.isHidden = true
            decimalLabel.isHidden = false
            hexaLabel.isHidden = true
        case 3:
            binaryLabel.isHidden = true
            octalLabel.isHidden = true
            decimalLabel.isHidden = true
            hexaLabel.isHidden = false
        case 4:
            binaryLabel.isHidden = false
            octalLabel.isHidden = false
            decimalLabel.isHidden = false
            hexaLabel.isHidden = false
        default:
            binaryLabel.isHidden = false
            octalLabel.isHidden = true
            decimalLabel.isHidden = true
            hexaLabel.isHidden = true
        }
        
    }
    
    @IBOutlet weak var baseSelector: UISegmentedControl!
    @IBOutlet weak var numberInput: UITextField!
    @IBOutlet weak var changeNumber: UIStepper!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var baseToPicker: UIPickerView!
    @IBOutlet weak var theView: UIView!
    @IBOutlet weak var baseLabel: UILabel!
    @IBOutlet weak var binaryLabel: UILabel!
    @IBOutlet weak var octalLabel: UILabel!
    @IBOutlet weak var decimalLabel: UILabel!
    @IBOutlet weak var hexaLabel: UILabel!
    @IBOutlet weak var theImage: UIImageView!
    var baseConvert: BaseConvert!
    var selectedRow: Int = 0
    
    @IBAction func resetButton(_ sender: Any) {
        theView.isHidden = false
    }
    
    @IBAction func typingNumber(_ sender: Any) {
        if let newNum = Int(numberInput.text!, radix: Int(baseLabel.text!)!) {
            errorMessage.isHidden = true
            changeNumber.value = Double(newNum)
        }else{
            errorMessage.isHidden = false
            numberInput.text = ""
        }
    }
    @IBAction func changeNumber(_ sender: Any) {
        baseConvert = BaseConvert(numberInput.text!, baseLabel.text!)
        numberInput.text = baseConvert.incrementDecrement(Int(changeNumber.value))
        changeLabels(changeNumber ?? "")
        
    }
    
    @IBAction func changeLabels(_ sender: Any){
        baseConvert = BaseConvert(numberInput.text!, baseLabel.text!)
        if let newNum = Int(numberInput.text!, radix: Int(baseLabel.text!)!) {
            var results = ("","","","")
            switch(baseLabel.text!){
            case "8":
                results = baseConvert.octalToAll()
            case "10":
                results = baseConvert.decimalToAll()
            case "16":
                results = baseConvert.hexadecimalToAll()
            default:
                results = baseConvert.binaryToAll()
            }
            binaryLabel.text  = "Binary:  " + results.0
            octalLabel.text   = "Octal:  " + results.1
            decimalLabel.text = "Decimal:  " + results.2
            hexaLabel.text    = "Hexadecimal:  " + results.3
        }
    }
    
    @IBAction func selectBase(_ sender: Any) {
        numberInput.text = ""
        errorMessage.isHidden = true
        switch(baseSelector.selectedSegmentIndex){
        case 1:
            baseLabel.text = "8"
        case 2:
            baseLabel.text = "10"
        case 3:
            baseLabel.text = "16"
        default:
            baseLabel.text = "2"
        }
    }
    @IBAction func enterApp(_ sender: Any) {
        theView.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        theImage.image = UIImage(named: "Numbers.png")
        baseSelector.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: UIControl.State.selected)
        baseSelector.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: UIControl.State.normal)
        changeNumber.setDecrementImage(changeNumber.decrementImage(for: .normal), for: .normal)
        changeNumber.setIncrementImage(changeNumber.incrementImage(for: .normal), for: .normal)
        changeNumber.tintColor = UIColor.lightGray
        self.baseToPicker.delegate = self
        self.baseToPicker.dataSource = self
       
        // Do any additional setup after loading the view.
    }


}

