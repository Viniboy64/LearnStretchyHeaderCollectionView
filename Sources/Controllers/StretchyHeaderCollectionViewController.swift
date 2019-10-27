//
//  StretchyHeaderCollectionViewController.swift
//  LearnStretchyHeaderCollectionView
//
//  Created by Marcus Vinícius on 27/10/19.
//  Copyright © 2019 Marcus Vinícius. All rights reserved.
//

import UIKit

class StretchyHeaderCollectionViewController: UICollectionViewController {
    fileprivate let cellIdentifier: String = "Cell"
    fileprivate let headerIdentifier: String = "Header"
    fileprivate let padding: CGFloat = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupSettings()
    }
    
    fileprivate func setupLayout() {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        layout.minimumLineSpacing = padding
    }
    
    fileprivate func setupSettings() {
        collectionView.backgroundColor = .white
        collectionView.register(StretchyHeaderCollectionReusableHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView.register(StretchyHeaderCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}

extension StretchyHeaderCollectionViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as? StretchyHeaderCollectionReusableHeaderView else { return UICollectionReusableView() }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width, height: 296.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? StretchyHeaderCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - (2 * padding), height: 48.0)
    }
}
