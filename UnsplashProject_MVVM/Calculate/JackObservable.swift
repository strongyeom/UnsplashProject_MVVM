//
//  JackObservable.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/13.
//

import Foundation

// Observable 구조 파악하기
class CustomObservable<T> {
    
    
    private var listener: ((T) -> Void)?
    
    var value: T {
        // 바뀔때 마다 확인하고 싶음
        didSet {
            print("사용자의 이름이 \(value)으로 변경되었습니다.")
            listener?(value)
        }
    }
    
    init(_ name: T) {
        self.value = name
    }
    
    func bind(_ sample: @escaping (T) -> Void) {
        print("저는 \(value)입니다.")
        sample(value)
        listener = sample
    }
    
}
