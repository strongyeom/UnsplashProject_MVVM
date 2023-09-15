//
//  User.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/15.
//

import Foundation
// Model에 Hashable 채택
// Model은 클래스보다 구조체를 사용!
class User: Hashable {
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    // id기준으로 고유성 판별해서 Hash함수 실행
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    let id = UUID().uuidString // Unique : name age가 같더라도 문제가 생기지 않게 처리를 해준다.
    let username: String
    let age: Int
    let height: Int
    
    var introduce: String {
        return  "\(username), \(age)살"
    }
    
    init(username: String, age: Int, height: Int) {
        self.username = username
        self.age = age
        self.height = height
    }
}

// Model이 구조체라면 Hashable과 UUID만 설정해주면 된다.
struct User1: Hashable {

    let id = UUID().uuidString // Unique : name age가 같더라도 문제가 생기지 않게 처리를 해준다.
    let username: String
    let age: Int
    let height: Int
    
    var introduce: String {
        return  "\(username), \(age)살"
    }

}
