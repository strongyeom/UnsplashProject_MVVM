//
//  LoginViewModel.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/12.
//

import Foundation

class LoginViewModel {
    
    var id = Observable("")
    var pw = Observable("")
    var isVaild = Observable(false)
    
    func checkVaildation() {
        if id.value.count >= 6 && pw.value.count >= 4 {
            isVaild.value = true
        } else {
            isVaild.value = false
        }
    }
    
    func signIn(completionHandler: @escaping () -> Void) {
        // 서버, 닉네임, id
        UserDefaults.standard.set(id.value, forKey: "id")
        completionHandler()
    }
    
}
