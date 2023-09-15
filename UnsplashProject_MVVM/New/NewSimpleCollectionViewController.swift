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
    
    enum Section: Int, CaseIterable {
        case first = 2000
        case second = 1
    }
    
    
    
    // 모델의 값중 하나만 다르면 런타임 에러 발생하지 않음 but 완전히 똑같으면 런타임 에러 발생 -> UUID 만들어주기
    let list: [User] = [
    User(username: "빛깔", age: 23, height: 100),
    User(username: "빛깔", age: 23, height: 100),
    User(username: "브랜뉴", age: 26, height: 200),
    User(username: "코코", age: 20, height: 250),
    ]
    
    // section 2에 들어갈 배열을 하나더 만들어준다.
    let list2: [User] = [
    User(username: "두번째 섹션", age: 23, height: 100),
    User(username: "두번쨰 섹션", age: 23, height: 100),
    User(username: "브랜뉴", age: 26, height: 200),
    User(username: "코코", age: 20, height: 250),
    ]
    
    // 1️⃣
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    // cellforRowAt에서 사용하기 위해 변수 설정
    // 3️⃣ collectionView.register
    var cellResisteration: UICollectionView.CellRegistration<UICollectionViewListCell, User>!
    
    // Int: Section의 자료형
    // User: 내가 만들어 놓은 Model
    var dataSource: UICollectionViewDiffableDataSource<String,User>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        // 제거
        // collectionView.dataSource = self
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // collectionView : 어떤 클래스를 갖고 올 것인가?
        // dataSource == CellForItemAt 과 동일한 역할을 함
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.cellResisteration, for: indexPath, item: itemIdentifier)
            return cell
            
        })
        
        
        
        
        
        
        
        // 5️⃣ UICollectionView.CellRegistration<Cell, Item> : Cell을 등록할 수 있는 방법 iOS 14.0 이상
        // identifier, xib register 사용 X, 대신에 제네릭을 이용 셀이 생성될 때마다 클로저가 호출
        cellResisteration =  UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            // cell에 대한 디자인 및 데이터처리 이뤄짐
            // systemCell 불러오기
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.username
            // textProperties: text UI 속성 설정
            content.textProperties.color = .brown
            content.secondaryText = "\(itemIdentifier.age)"
            content.image = UIImage(systemName: "flame")
            content.imageProperties.tintColor = .yellow
            // prefersSideBySideTextAndSecondaryText : 타이틀과 서브타이틀 세로 라인으로 정렬
            content.prefersSideBySideTextAndSecondaryText = false
            // textToSecondaryTextVerticalPadding : 타이틀과 서브타이틀 사이의 padding 설정
            content.textToSecondaryTextVerticalPadding = 20
            cell.contentConfiguration = content
            
            
            // Cell 자체의 background 설정을 바꿀 수 있음 
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .lightGray
            backgroundConfig.cornerRadius = 10
            backgroundConfig.strokeWidth = 2
            backgroundConfig.strokeColor = .systemPink
            cell.backgroundConfiguration = backgroundConfig
            
            
            
        }
        
        // numberOfItemInSection 역할
        
        // NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType>
        // Section Enum은 고유하기 때문에 사용할 수 있음
        var snapshot = NSDiffableDataSourceSnapshot<String, User>()
        // Section을 하나만 쓸거고
        // appendSections 안에 들어가는것이 indexPath가 아니고 Item 배열에 담기는 종류들임 즉 데이터 기반
        snapshot.appendSections(["고래밥", "Jack"])
        
        // list를 추가해 줄거야
        snapshot.appendItems(list, toSection: "고래밥")
        snapshot.appendItems(list2, toSection: "Jack")
        // View에 갱신을 해줘라
        dataSource.apply(snapshot)
   
    }
    
    // 2️⃣ collectionView 시점으로 인해 static 설정해야함
    static func createLayout() -> UICollectionViewLayout {
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
    
    
}

//extension NewSimpleCollectionViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        // 4️⃣ using: UICollectionView.CellRegistration<Cell, Item> : cell.label, cell. ~ 여기서 설정

//
//}
