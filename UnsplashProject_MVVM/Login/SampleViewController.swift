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
