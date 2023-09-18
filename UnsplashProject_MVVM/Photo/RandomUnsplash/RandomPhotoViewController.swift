//
//  RandomPhotoViewController.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/18.
//

import UIKit
import SnapKit

class RandomPhotoViewController: UIViewController {
    
    
    let button = {
       let view = UIButton()
        view.setTitle("시작", for: .normal)
        view.tintColor = .yellow
        return view
    }()
    
    let viewModel = RandomPhotoViewModel()
    
    let unsplashCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    var dataSource: UICollectionViewDiffableDataSource<Int, RandomPhoto>!
    
    var page: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settup()
        unsplashCollectionView.prefetchDataSource = self
        viewModel.fetchRequest(page: page)
        
        configureDataSourece()
        
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
       
    }
    
    @objc func btnClicked() {
        viewModel.list.bind { _ in
            // 3. apply
            self.updateApply()
        }
    }
    
    func settup() {
        view.addSubview(button)
        view.addSubview(unsplashCollectionView)
        button.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        unsplashCollectionView.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureDataSourece() {
        // 1. cell 등록
        let cellRegiseration = UICollectionView.CellRegistration<UICollectionViewCell,RandomPhoto> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.alt_description
            DispatchQueue.global().async {
                let url = URL(string: itemIdentifier.urls.thumb ?? "")!
                let data = try! Data(contentsOf: url)
                DispatchQueue.main.async {
                    content.image = UIImage(data: data)
                    cell.contentConfiguration = content
                }
            }
        }
        // 2. dataSource
        dataSource = UICollectionViewDiffableDataSource<Int, RandomPhoto>(collectionView: unsplashCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegiseration, for: indexPath, item: itemIdentifier)
            return cell
        })
       
    }
    
    func updateApply() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, RandomPhoto>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.list.value)
        dataSource.apply(snapshot)
    }
}

extension RandomPhotoViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        // 응답 메세지로 page에 대한 값이 정해져 있다면 조건을 추가해준다.
        // 또한 마지막 페이지가 나오면 더이상 page를 증가시키지 않는다.
        for indexPath in indexPaths {
            
            if viewModel.list.value.count - 1 == indexPath.item {
                page += 1
                viewModel.fetchRequest(page: page)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        print("===== cancelPrefetchingForItemsAt")
    }
}

extension RandomPhotoViewController {
    static func layout() -> UICollectionViewLayout {
        let configure = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configure)
        return layout
    }
}
