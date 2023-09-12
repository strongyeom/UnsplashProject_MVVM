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
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
        loginBtn.addTarget(self, action: #selector(loginBtnClicked(_:)), for: .touchUpInside)
        idTextField.addTarget(self, action: #selector(idTextFieldChanged), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextFieldChanged), for: .editingChanged)
        
        
        viewModel.id.bind { text in
            print("====ID Bind \(text)")
            self.idTextField.text = text
        }
        
        viewModel.pw.bind { text in
            print("====PW Bind \(text)")
            self.pwTextField.text = text
        }
        
        viewModel.isVaild.bind { isValid in
            self.loginBtn.isEnabled = isValid
            self.loginBtn.backgroundColor = isValid ? .green : .lightGray
        }
    }
    
    @objc func pwTextFieldChanged() {
       
        viewModel.pw.value = pwTextField.text!

        viewModel.checkVaildation()
    }
    
    @objc func idTextFieldChanged() {
        viewModel.id.value = idTextField.text!
        
        viewModel.checkVaildation()
    }
    
    @objc func loginBtnClicked(_ sender: UIButton) {
        // 어차피 isVaild가 false이면 isEnabled도 false이기 때문에 사용하지 못함
        // 유효성 검증을 통과했을경우에만 isEnabled == true가 되기 때문에 분기처리 안해줘도 됨
       
        viewModel.signIn {
            print("로그인 성공했습니다.")
        }
    }

}
