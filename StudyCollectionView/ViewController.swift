//
//  ViewController.swift
//  StudyCollectionView
//
//  Created by Vladimir Oleinikov on 24.08.2021.
//

import UIKit

class ViewController: UIViewController {

    enum Section {
        case main
    }
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    var collectionViewDiffDataSource: UICollectionViewDiffableDataSource<Section,Int>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.collectionViewLayout = myLayoutForCollectionView()
        configureCollectionViewDataSource()
        
    }

    func myLayoutForCollectionView() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    func configureCollectionViewDataSource() {
        collectionViewDiffDataSource = UICollectionViewDiffableDataSource<Section,Int>(collectionView: myCollectionView)
        {
            [weak self] collectionView, indexPath, number in
            guard let cell = self?.myCollectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.reuseIdentifier , for: indexPath) as? NumberCell
                else { fatalError ("Have a good day") }
            
            cell.numberLabel.text = number.description
            
            return cell
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(1...100), toSection: .main)
        
        collectionViewDiffDataSource.apply(snapshot,animatingDifferences: false)
    }
}

