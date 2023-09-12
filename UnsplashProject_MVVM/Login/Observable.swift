//
//  Observable.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/12.
//

import Foundation

class Observable {
    
    private var listener: ((Int) -> Void)?
    
    var value: Int {
        // 바뀔때마다 신호를 감지 할 수 있음
        didSet {
            listener?(value)
        }
    }
    
    init(value: Int) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (Int) -> Void) {
        print(#function)
        closure(value)
        listener = closure
    }
}
