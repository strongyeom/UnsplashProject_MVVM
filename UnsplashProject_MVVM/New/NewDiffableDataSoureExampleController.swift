//
//  NewDiffableDataSoureExampleController.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/15.
//

import UIKit
import SnapKit

class NewDiffableDataSoureExampleController: UIViewController {
    
    
    // 모델의 값중 하나만 다르면 런타임 에러 발생하지 않음 but 완전히 똑같으면 런타임 에러 발생 -> UUID 만들어주기
    let list: [User] = [
    User(username: "첫번째 섹션에 일번", age: 23, height: 100),
    User(username: "첫번째 섹션에 이번", age: 23, height: 100),
    User(username: "첫번째 섹션에 삼번", age: 26, height: 200),
    User(username: "첫번째 섹션에 사번", age: 20, height: 250)
    ]
    
    let customCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    
    var cellResisteration: UICollectionView.CellRegistration<UICollectionViewCell, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customCollectionView)
        customCollectionView.delegate = self
        customCollectionView.dataSource = self
        
        customCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cellResisteration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            
            content.text = itemIdentifier.username
            content.secondaryText = "\(itemIdentifier.age)"
            content.textProperties.color = .green
            content.textProperties.font = .systemFont(ofSize: 20, weight: .medium)
            content.secondaryTextProperties.color = .red
            content.prefersSideBySideTextAndSecondaryText = false
            
            cell.contentConfiguration = content
            
        })
         
    }
    
    static func layout() -> UICollectionViewLayout {
        let configure = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configure)
        return layout
    }
    
    
    
    
    
    
}
extension NewDiffableDataSoureExampleController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = list[indexPath.item]
        let cell = collectionView.dequeueConfiguredReusableCell(using: self.cellResisteration, for: indexPath, item: data)
        return cell
    }
}
