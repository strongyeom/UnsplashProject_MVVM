//
//  RandomPhoto.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/18.
//

import Foundation

//
//  Photo.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/12.
//

import Foundation

struct RandomPhoto: Codable, Hashable {
    let alt_description: String?
    var urls: RandomPhotoURL
}

struct RandomPhotoURL: Codable, Hashable{
    let thumb: String?
}
