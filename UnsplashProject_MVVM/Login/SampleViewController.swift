//
//  SampleViewController.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/12.
//

import UIKit

struct User {
    let username: String
    let age: Int
    
    var introduce: String {
        return  "\(username), \(age)살"
    }
}

class SampleViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let viewModel = SampleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 단방향과 양방향 예시 코드
        var number1 = 10
        var number2 = 3
        
        print(number1 - number2)
        
        number1 = 3
        number2 = 1
        
        //
        
        var number3 = Observable(value: 10)
        var number4 = Observable(value: 3)
        
        number3.bind { number in
            print("Observable", number3.value - number4.value)
        }
        
        number3.value = 100
        number3.value = 500
        number3.value = 50
        
        
        
        
        
        
        

        tableView.delegate = self
        tableView.dataSource = self
        
    }
   
}
extension SampleViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell")!
        let data = viewModel.cellForRowAt(indexPath: indexPath)
        cell.textLabel?.text = data.introduce
        
        return cell
    }
}
