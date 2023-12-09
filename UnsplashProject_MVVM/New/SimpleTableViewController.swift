//
//  SimpleTableViewController.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/14.
//

import UIKit

class SimpleTableViewController: UITableViewController {
    
    let list: [User] = [
    User(username: "빛깔", age: 21, height: 100),
    User(username: "잭더리퍼", age: 23, height: 150),
    User(username: "브랜뉴", age: 26, height: 200),
    User(username: "코코", age: 20, height: 250),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell()
//        var content = cell.defaultContentConfiguration()
//        content.text = list[indexPath.row].username
//        content.secondaryText = "\(list[indexPath.row].age)"
//        cell.contentConfiguration = content
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = list[indexPath.row].username
        content.secondaryText = "\(list[indexPath.row].age)"
        cell.contentConfiguration = content
        
        return cell
    }
}
