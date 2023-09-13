//
//  JackObservable.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/13.
//

import Foundation

// Observable 구조 파악하기
class Person {
    
    
    var listener: ((String) -> Void)?
    
    var name: String {
        // 바뀔때 마다 확인하고 싶음
        didSet {
            print("사용자의 이름이 \(name)으로 변경되었습니다.")
            listener?(name)
        }
    }
    
    init(_ name: String) {
        self.name = name
    }
    // 사용자에게 보여주기 위해 클로저안에 자료형 변경
    func introduce(_ sample: @escaping (String) -> Void) {
        print("저는 \(name)입니다.")
        sample(name)
        listener = sample
    }
    
}
