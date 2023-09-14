//
//  NewSimpleCollectionViewController.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/14.
//

import UIKit
import SnapKit

//  ListConfiguration을 사용해서 CollectionCell -> TableCell 처럼 보이게 하기
class NewSimpleCollectionViewController: UIViewController {
    
    let list: [User] = [
    User(username: "빛깔", age: 21),
    User(username: "잭더리퍼", age: 23),
    User(username: "브랜뉴", age: 26),
    User(username: "코코", age: 20),
    ]
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    // cellforRowAt에서 사용하기 위해 변수 설정
    var cellResisteration: UICollectionView.CellRegistration<UICollectionViewListCell, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // UICollectionView.CellRegistration<Cell, Item> : Cell을 등록할 수 있는 방법 iOS 14.0 이상
        // identifier, xib register 사용 X, 대신에 제네릭을 이용 셀이 생성될 때마다 클로저가 호출
        cellResisteration =  UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            // cell에 대한 디자인 및 데이터처리 이뤄짐
            // systemCell 불러오기
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.username
            content.secondaryText = "\(itemIdentifier.age)"
            content.image = UIImage(systemName: "flame")
            cell.contentConfiguration = content
        }
        
        
   
    }
    
    // collectionView 시점으로 인해 static 설정해야함
    static func createLayout() -> UICollectionViewLayout {
        // ListConfiguration을 사용해서 Cell Layout 설정
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        // List 형식으로 configuration을 만들어줘
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    
}

extension NewSimpleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // using: UICollectionView.CellRegistration<Cell, Item> : cell.label, cell. ~ 여기서 설정
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellResisteration, for: indexPath, item: list[indexPath.item])
        return cell
    }
    
}
