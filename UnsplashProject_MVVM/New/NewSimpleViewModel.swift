//
//  NewSimpleViewModel.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/18.
//

import Foundation

class NewSimpleViewModel {
    
    
    var list = Observable<[User]>([])
    
    func append() {
        list.value = [
            // 모델의 값중 하나만 다르면 런타임 에러 발생하지 않음 but 완전히 똑같으면 런타임 에러 발생 -> UUID 만들어주기
            User(username: "빛깔", age: 23, height: 100),
            User(username: "빛깔", age: 23, height: 100),
            User(username: "브랜뉴", age: 26, height: 200),
            User(username: "코코", age: 20, height: 250)
        ]
    }
    
    func remove() {
        list.value = []
    }
    
    func removeUser(index : Int) {
        list.value.remove(at: index)
    }
    
    
    // section 2에 들어갈 배열을 하나더 만들어준다.
    var list2: [User] = [
        User(username: "두번째 섹션", age: 23, height: 100),
        User(username: "두번쨰 섹션", age: 23, height: 100),
        User(username: "브랜뉴", age: 26, height: 200),
        User(username: "코코", age: 20, height: 250),
    ]
}
