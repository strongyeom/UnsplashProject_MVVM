//
//  NumberViewController.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/18.
//

import UIKit

class NumberViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let viewModel = NumberViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
        
        bindData()

    }
    
    func bindData() {
        
        viewModel.number.bind { text in
            self.numberTextField.text = text
        }
        
        viewModel.result.bind { text in
            self.resultLabel.text = text
        }
    }
    
    @objc func numberTextFieldChanged() {
        viewModel.number.value = numberTextField.text!
        viewModel.convertNumber()
    }
}
