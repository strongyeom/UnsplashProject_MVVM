//
//  PhotoViewController.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/12.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var viewModel = PhotoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        viewModel.callRequest()
        
        viewModel.list.bind { _ in
            // 메인쓰레드에서 하는 이유 : 데이터 통신이 비동기로 작업하기 때문에 UI를 다시 그릴때는 메인 쓰레드에서 그려줘야함
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
}
extension PhotoViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as! PhotoTableViewCell
        
//        cell.imageView?.image = UIImage(systemName: "flame")
        let data = viewModel.cellForRowAt(indexPath: indexPath)
        
        let unsplashurl = URL(string: data.urls.thumb)!
        // 비동기로 작업
        DispatchQueue.global().async {
            // 이미지 주소 Data화 시키기
            let data = try! Data(contentsOf: unsplashurl)
            
            // Main Thread에서 그려주기
            DispatchQueue.main.async {
                // 데이터 통신 해서 image에 넣기
                cell.photoImage.image = UIImage(data: data)
                print("**\(indexPath.row)")
            }
        }
        return cell
    }
    
}
