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
        // 데이터가 변화하면 감지해라
        var number3 = Observable(10)
        var number4 = Observable(3)
        // 변화되었으면 기능을 해라
        number3.value = 100
        
        number3.bind { number in
            print("Observable", number3.value - number4.value)
            
        }
        
       
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
//        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell")!
//        let data = viewModel.cellForRowAt(indexPath: indexPath)
//        cell.textla
        
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "테스트" // textLabel
        content.secondaryText = "안녕하세여 \(indexPath.row)" // detailTextLabel
        
        
        // 타입이 다른데 어떻게 넣을수 있지 ?
        // UIListContentConfiguration에 프로토콜로 UIContentConfiguration이 채택되어 있음
        cell.contentConfiguration = content // Protocoal as Type
        
        return cell
    }
}














