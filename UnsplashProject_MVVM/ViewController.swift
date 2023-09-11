//
//  ViewController.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var changeButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nicknameTextField.placeholder = NSLocalizedString("nickname_placeholder", comment: "")
        
    }


}

