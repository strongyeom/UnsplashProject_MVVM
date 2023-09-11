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
        
        nicknameTextField.placeholder = "nickname_placeholder".localized
        
        // String을 언어 설정별 하기 위한 변수 %@ 설정하고 
//        let value = NSLocalizedString("nickname_result", comment: "")
//        resultLabel.text = String(format: value, "고래밥","콩딱핑","다마고치")
//
        resultLabel.text = "age_result".localized(number: 55)
        
        
        // cmd + ctl + e
        let badsdsdsdsdsdr = UISearchBar()
        badsdsdsdsdsdr.text = "qweq"
        badsdsdsdsdsdr.placeholder = "123132"
        
        
        
        
        
    }
    
    
    // 멀티 클릭 기능
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function) // Ctrl + Shift + 클릭
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function) // Ctrl + Shift + 클릭
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function) // Ctrl + Shift + 클릭
    }


}

