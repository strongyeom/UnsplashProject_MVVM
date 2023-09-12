//
//  LoginViewController.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/12.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
        loginBtn.addTarget(self, action: #selector(loginBtnClicked(_:)), for: .touchUpInside)
     
    }
    
    @objc func loginBtnClicked(_ sender: UIButton) {
        // 텍스트 필드 유효성 검사
        guard let id = idTextField.text else { return }
        guard let pw = pwTextField.text else { return }
        
        if id.count >= 6 && pw == "1234" {
            print("로그인했어요")
        } else {
            print("로그인 실패")
        }
    }

}
