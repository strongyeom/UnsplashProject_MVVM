//
//  JackObservable.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/13.
//

import Foundation

// Observable 구조 파악하기
class Person {
    
    var luckyNumber: Int?
    var listener: (() -> Void)?
    
    var name: String {
        // 바뀔때 마다 확인하고 싶음
        didSet {
            print("사용자의 이름이 \(name)으로 변경되었습니다. 당신이 뽑은 행운의 숫자는 \(luckyNumber ?? 0)입니다.")
            listener?()
        }
    }
    
    init(_ name: String) {
        self.name = name
    }
    
    func introduce(_ number: Int, sample: @escaping () -> Void) {
        print("저는 \(name)이고 행운의 숫자는 \(number)입니다.")
        sample()
        listener = sample
        luckyNumber = number
        
    }
    
}
