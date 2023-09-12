//
//  SampleViewModel.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/12.
//

import Foundation

class SampleViewModel {
    var list: [User] = [
    User(username: "빛깔", age: 21),
    User(username: "잭더리퍼", age: 23),
    User(username: "브랜뉴", age: 26),
    User(username: "코코", age: 20),
    ]
    
    var numberOfRowsInSection: Int {
        return list.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
}
