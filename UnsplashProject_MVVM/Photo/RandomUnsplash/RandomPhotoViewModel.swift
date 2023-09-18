//
//  RandomPhotoViewModel.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/18.
//

import Foundation

class RandomPhotoViewModel {
    
    
    var list =  Observable<[RandomPhoto]>([])
    
    func fetchRequest() {
        RandomAPIService.shared.callRequest { photo in
            DispatchQueue.main.async {
                self.list.value = photo
            }
        }
    }
}
