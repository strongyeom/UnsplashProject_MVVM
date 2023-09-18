//
//  PhotoViewController.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/12.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    var viewModel = PhotoViewModel()
    
    var dataSource: UICollectionViewDiffableDataSource<Int, PhotoResult>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        collectionView.collectionViewLayout = createLayout()
        configureDataSource()
        viewModel.list.bind { _ in
            print("PhotoVC",Thread.isMainThread)
            self.updateSnapshot()
        }
    }

    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, PhotoResult>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.list.value.results!)
        dataSource.apply(snapshot)
    }
    
   
    private func createLayout() -> UICollectionViewLayout {
        // ListConfiguration을 사용해서 Cell Layout 설정
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        // separator 안보이게 하기
        configuration.showsSeparators = false
        // collectionView backgroundColor 설정
        configuration.backgroundColor = .systemGreen
        // List 형식으로 configuration을 만들어줘
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    
    private func configureDataSource() {
        
        let cellRegisteration = UICollectionView.CellRegistration<UICollectionViewCell, PhotoResult> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = "\(itemIdentifier.likes)"
            
            // 이미지 -> 데이터 ->
            
            DispatchQueue.global().async {
                let url = URL(string: itemIdentifier.urls.thumb)!
                let data = try! Data(contentsOf: url)
                DispatchQueue.main.async {
                    content.image = UIImage(data: data)
                    // 시점응 위해 DispatchQueue.main.async 안에서 적용한다.
                    cell.contentConfiguration = content
                }
            }
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}

extension PhotoViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.callRequest(text: searchBar.text!)
    }
}
