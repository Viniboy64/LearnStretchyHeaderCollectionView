//
//  StretchyHeaderCollectionReusableHeaderView.swift
//  LearnStretchyHeaderCollectionView
//
//  Created by Marcus Vinícius on 27/10/19.
//  Copyright © 2019 Marcus Vinícius. All rights reserved.
//

import UIKit

class StretchyHeaderCollectionReusableHeaderView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
}
