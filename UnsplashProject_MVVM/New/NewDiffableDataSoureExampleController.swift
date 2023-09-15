//
//  NewDiffableDataSoureExampleController.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/15.
//

import UIKit
import SnapKit

class NewDiffableDataSoureExampleController: UIViewController {
    
    let newPhotoViewModel = NewPhotoViewModel()
    
    enum Section: Int,CaseIterable {
        case first = 2000
    }
    
    
    let customCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    
    var cellResisteration: UICollectionView.CellRegistration<UICollectionViewCell, PhotoResult>!
    
    // 1️⃣ dataSource 생성
    var dataSource: UICollectionViewDiffableDataSource<Section,PhotoResult>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customCollectionView)
        // customCollectionView.dataSource = self
        
        customCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        

        
        newPhotoViewModel.list.bind { _ in
            DispatchQueue.main.async {
                self.dataSourceApply()
            }
        }
        
        newPhotoViewModel.callRequest(query: "sky")
        
        configureView()
        dataSourceApply()


         
    }
    

    
    func configureView() {
        // 여기서 Cell에 Model에 해당되는 것이 할당된다.
        cellResisteration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            
            content.text = itemIdentifier.description
            content.secondaryText = itemIdentifier.id
            print(content.secondaryText)
            cell.contentConfiguration = content
            
        })
        
        // 2️⃣ dataSource에 등록되고 Model데이터 적용된 Cell 보여주기
        dataSource = UICollectionViewDiffableDataSource(collectionView: customCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in

            let cell = collectionView.dequeueConfiguredReusableCell(using: self.cellResisteration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    func dataSourceApply() {
        // 3️⃣ apply 통해 갱신하기
        // 할당된 데이터를 snapShot에 담아준다.
        var snapShot = NSDiffableDataSourceSnapshot<Section, PhotoResult>()
        snapShot.appendSections(Section.allCases)
        
        snapShot.appendItems(newPhotoViewModel.list.value.results!, toSection: Section.first)
        // snapShot에 담아준 것을 리로드 시킨다.
        dataSource.apply(snapShot)
    }
    
    
    // layout() 함수는 static으로 구성되어 있기 때문에 어디에 위치하던 상관없다
    static func layout() -> UICollectionViewLayout {
        let configure = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configure)
        return layout
    }

}

//extension NewDiffableDataSoureExampleController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("numberof : \(newPhotoViewModel.list.value.results?.count)")
//        return newPhotoViewModel.list.value.results?.count ?? 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let data = newPhotoViewModel.list.value.results?[indexPath.item]
//        let cell = collectionView.dequeueConfiguredReusableCell(using: self.cellResisteration, for: indexPath, item: data!)
//            return cell
//    }
//}
