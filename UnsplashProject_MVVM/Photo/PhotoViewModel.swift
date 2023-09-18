//
//  PhotoViewModel.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/12.
//

import Foundation

class PhotoViewModel {
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    func callRequest(text: String) {
        APIService.shared.searchPhoto(query: text) { photo in
            DispatchQueue.main.async {
                guard let photo else { return }
                self.list.value = photo
            }
        }
    }
    
    var numberOfRowsInSection: Int {
        return list.value.results?.count ?? 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> PhotoResult {
        return list.value.results![indexPath.row]
    }

}
