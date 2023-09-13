//
//  JackObservable.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/13.
//

import Foundation

// Observable 구조 파악하기
class Person {
    
   
    var name: String {
        // 바뀔때 마다 확인하고 싶음
        didSet {
            print("사용자의 이름이 \(name)으로 변경되었습니다.")
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    
    
}
