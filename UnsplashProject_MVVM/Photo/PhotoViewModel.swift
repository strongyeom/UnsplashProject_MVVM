//
//  PhotoViewModel.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/12.
//

import Foundation

class PhotoViewModel {
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    func callRequest() {
        APIService.shared.searchPhoto(query: "cat") { photo in
            guard let photo else { return }
            self.list.value = photo
        }
    }
    
    var numberOfRowsInSection: Int {
        return list.value.results?.count ?? 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> PhotoResult {
        return list.value.results![indexPath.row]
    }
    
}
