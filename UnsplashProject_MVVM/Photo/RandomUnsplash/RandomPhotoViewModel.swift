//
//  RandomPhotoViewModel.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/18.
//

import Foundation

class RandomPhotoViewModel {
    
    
    var list = Observable<[RandomPhoto]>([])
    
    func fetchRequest(page: Int) {
        RandomAPIService.shared.callRequest(page: page) { photo in
            DispatchQueue.main.async {
                self.list.value.append(contentsOf: photo)
            }
        }
    }
    
    func removeData(selectedCell: Int) {
        self.list.value.remove(at: selectedCell)
        
    }
}
