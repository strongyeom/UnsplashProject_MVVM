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
    
    var dataSource: UICollectionViewDiffableDataSource<Int,User>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customCollectionView)
        // customCollectionView.dataSource = self
        
        customCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        

        
        
        // 여기서 Cell에 Model에 해당되는 것이 할당된다.
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
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: customCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.cellResisteration, for: indexPath, item: itemIdentifier)
            return cell
        })
        
        // 할당된 데이터를 snapShot에 담아준다.
        var snapShot = NSDiffableDataSourceSnapshot<Int, User>()
        snapShot.appendSections([0])
        snapShot.appendItems(list)
        
        // snapShot에 담아준 것을 리로드 시킨다.
        dataSource.apply(snapShot)
        
         
    }
    
    
    static func layout() -> UICollectionViewLayout {
        let configure = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configure)
        return layout
    }

    
    
    
    
    
    
}

//extension NewDiffableDataSoureExampleController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let data = list[indexPath.item]
//        let cell = collectionView.dequeueConfiguredReusableCell(using: self.cellResisteration, for: indexPath, item: data)
//        return cell
//    }
//}
