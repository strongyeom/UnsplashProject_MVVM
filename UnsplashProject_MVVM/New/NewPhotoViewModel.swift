//
//  NewPhotoViewModel.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/15.
//

import Foundation

class NewPhotoViewModel {
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    func callRequest(query: String) {
        APIService.shared.searchPhoto(query: query) { photo in
            guard let photo else { return }
            print(photo.results?.count)
            self.list.value.results = photo.results
            print(self.list.value.results?.count)
        }
    }
}
