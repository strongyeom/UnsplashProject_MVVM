//
//  RandomAPIService.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/18.
//

import Foundation

// https://api.unsplash.com/photos/random?client_id=R87kkJUhEVTR_QPQo8pQOj7Q7sgWnUP8gTE8h0yOHB0

class RandomAPIService {
    static let shared = RandomAPIService()
    
    private init() { }
    
    
    func callRequest(completionHandler: @escaping ([RandomPhoto]) -> Void) {
        
        let url = URL(string: "https://api.unsplash.com/photos/random?client_id=R87kkJUhEVTR_QPQo8pQOj7Q7sgWnUP8gTE8h0yOHB0&count=10")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print(error)
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let data = try JSONDecoder().decode([RandomPhoto].self, from: data)
              //  print(data)
                completionHandler(data)
            } catch {
                print(error)
            }
        }.resume()
        
    }
}
