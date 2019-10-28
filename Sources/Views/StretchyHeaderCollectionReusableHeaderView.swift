//
//  StretchyHeaderCollectionReusableHeaderView.swift
//  LearnStretchyHeaderCollectionView
//
//  Created by Marcus Vinícius on 27/10/19.
//  Copyright © 2019 Marcus Vinícius. All rights reserved.
//

import UIKit

class StretchyHeaderCollectionReusableHeaderView: UICollectionReusableView {
    public var propertyAnimator: UIViewPropertyAnimator?
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "stretchy-header")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupBlurEffect()
    }
    
    private func setupLayout() {
        addSubview(headerImageView)
        
        headerImageView.fillSuperview()
    }
    
    private func setupBlurEffect() {
        propertyAnimator = UIViewPropertyAnimator(duration: 0.0, curve: .linear, animations: {
            let visualEffectView = UIVisualEffectView()
            visualEffectView.effect = UIBlurEffect(style: .dark)
            
            self.addSubview(visualEffectView)
            
            visualEffectView.fillSuperview()
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
}
