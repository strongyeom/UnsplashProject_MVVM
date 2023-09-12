//
//  Observable.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/12.
//

import Foundation

class Observable {
    
    private var listener: ((String) -> Void)?
    
    var value: String {
        // 바뀔때마다 신호를 감지 할 수 있음
        didSet {
            print("didset", value)
            listener?(value)
        }
    }
    
    init(value: String) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (String) -> Void) {
        print(#function)
        closure(value)
        listener = closure
    }
    
    
}
