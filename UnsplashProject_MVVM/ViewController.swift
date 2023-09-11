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
        
        // String을 언어 설정별 하기 위한 변수 %@ 설정하고 
        let value = NSLocalizedString("nickname_result", comment: "")
        resultLabel.text = String(format: value, "고래밥","콩딱핑","다마고치")
        
    }


}

