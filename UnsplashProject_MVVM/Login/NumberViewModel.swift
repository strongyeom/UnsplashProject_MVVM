//
//  NumberViewModel.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/18.
//

import Foundation

class NumberViewModel {
    
    var number: Observable<String?> = Observable("1000")
    var result = Observable("13,000,000")
    
    
    func convertNumber() {
        // 빈 값, 문자열, 백만원 내에서 가능한 범주 - 연산
        // 하나씩 하는 이유 ? 사용자에게 예외 처리 구문을 알려주기 위해서 UX 측면
        guard let text = number.value else {
            result.value = "값을 입력해주세요"
            return
        }
        
        // 문자열
        guard let textNumber = Int(text) else {
            result.value = "100만원 이하의 숫자를 입력해주세요"
            return
        }
        
        // 백만원 이하
        guard textNumber > 0, textNumber <= 1000000 else {
            result.value = "100만원 이하만 가능합니다."
            return
        }
        
        // 3자리 쉼표 처리
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        
        
        // 달러 환율 적용
        let decimalNumber = numberFormatter.string(for: textNumber * 1300)!
        
        
        
        
        result.value = "환전 금액은\(decimalNumber)원 입니다."
    }
    
}
