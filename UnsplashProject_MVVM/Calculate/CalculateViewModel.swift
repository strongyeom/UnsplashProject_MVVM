//
//  CalculateViewModel.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/13.
//

import Foundation

class CalculateViewModel {
    
    // 가공된 데이터 변수 만들기
    // 자료형을 CustomObservable<String?>으로 만들면 nil이 들어올 수 있다.
    var firstNumber: CustomObservable<String?> = CustomObservable("10")
    
    var secondNumber: CustomObservable<String?> = CustomObservable("20")
    
    var resultText = CustomObservable("결과")
    
    var tempText = CustomObservable("")
    
    func format(for number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: number)!
    }
    
    func presentNumberFormat() {
        
        guard let first = firstNumber.value, let firstConvertNumber = Int(first) else {
            resultText.value = "숫자로 변환 할 수 없어요."
            return
        }
        
        tempText.value = format(for: firstConvertNumber)
    }
    
    func calculate() {
        
        guard let first = firstNumber.value, let firstConvertNumber = Int(first) else {
            resultText.value = "첫번째 값에서 오류가 발생했습니다."
            return
        }
        
        guard let second = secondNumber.value, let secondConvertNumber = Int(second) else {
            resultText.value = "두번째 값에서 오류가 발생했습니다."
            return
        }
        
        resultText.value = "결과는 \(firstConvertNumber + secondConvertNumber) 입니다."
        
        
        
    }
    
    
    
}
