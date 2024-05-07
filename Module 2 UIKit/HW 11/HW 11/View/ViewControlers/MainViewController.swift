//
//  ViewController.swift
//  HW 11
//
//  Created by Игорь Крысин on 01.05.2024.
//

import UIKit

class MainViewController: UIViewController {
    let collectionData = CollectionSection.makeData()
    
    private lazy var collectionView: UICollectionView = {
        $0.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseId)
        $0.register(NewsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NewsHeaderCell.reuseId)
        $0.register(NewsFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NewsFooterCell.reuseId)
        
        $0.register(EventsCell.self, forCellWithReuseIdentifier: EventsCell.reusedId)
        $0.register(EventsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: EventsHeaderCell.reuseId)
        
        $0.register(UserCell.self, forCellWithReuseIdentifier: UserCell.reuseId)
        $0.register(UserHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: UserHeaderCell.reuseId)
        
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .appLightGray
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appLightGray
        view.addSubview(collectionView)
        
       
    }
    
    
   
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
                case 0: self.createNewsSection()
                case 1: self.createEventsSection()
                default: self.createUserSection()
            }
            
        }
    }
    
  
    
    private func createUserSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(193), heightDimension: .absolute(173))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30)
        
        section.boundarySupplementaryItems = [self.createUserHeaderSection()]
        
        return section
    }
    
    private func createUserHeaderSection() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(24)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
        footer.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return footer
    }
    
    
    private func createEventsSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 0)
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(302), heightDimension: .estimated(44))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [self.creaEventsHeaderSection()]
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 30, bottom: 20, trailing: 30)
        
       
        return section
        
    }
    
    private func creaEventsHeaderSection() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(24)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
        footer.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return footer
    }
    
    
    private func createNewsSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(296), heightDimension: .absolute(161))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [self.creaNewsHeaderSection(), self.creaNewsFooterSection()]
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30)
        
       
        return section
    }
    
    private func creaNewsHeaderSection() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(24)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
    
    private func creaNewsFooterSection() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(28)),
                                                                     elementKind: UICollectionView.elementKindSectionFooter,
                                                                     alignment: .bottom)
        footer.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: -50, trailing: 0)
        return footer
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData[section].group.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionData[indexPath.section].group[indexPath.item]
        //let item = collectionData[indexPath.section].group[indexPath.item]
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.reuseId, for: indexPath) as! NewsCell
            cell.setupCell(item: item)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventsCell.reusedId, for: indexPath) as! EventsCell
            cell.setupCell(item: item)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCell.reuseId, for: indexPath) as! UserCell
            cell.setupCell(item: item)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let item = collectionData[indexPath.section]
        //print(item.group[indexPath.section].textLabel)
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if indexPath.section == 0 {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NewsHeaderCell.reuseId, for: indexPath) as! NewsHeaderCell
                header.setupHeader(header: item.header)
                return header
            }
            else if indexPath.section == 1 {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: EventsHeaderCell.reuseId, for: indexPath) as! EventsHeaderCell
                header.setupCell  (header: item.header)
                return header
            } else {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: UserHeaderCell.reuseId, for: indexPath) as! UserHeaderCell
                header.setupCell(header: item.header)
                return header
            }
            
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NewsFooterCell.reuseId, for: indexPath) as! NewsFooterCell
            footer.setupFooter(footer: item.footer ?? "")
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    
    
    
}

