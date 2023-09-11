//
//  String+Ext.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/11.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(number: Int) -> String {
        return String(format: self.localized, number)
    }
}

/*
 
 nicknameTextField.placeholder = NSLocalizedString("nickname_placeholder", comment: "")
 
 // String을 언어 설정별 하기 위한 변수 %@ 설정하고
 let value = NSLocalizedString("nickname_result", comment: "")
 resultLabel.text = String(format: value, "고래밥","콩딱핑","다마고치")
 
 */
