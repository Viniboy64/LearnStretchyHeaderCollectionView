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
    
    private let padding: CGFloat = 16.0
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "stretchy-header")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let gradientContainerView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "God of War"
        label.textColor = .white
        label.textAlignment = .natural
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "God of War is a surreal and mind-blowing action-RPG that provides a adventure through Norse mythology. It's a long, satisfying game that offers much more beyond just a linear campaign."
        label.textColor = .white
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupBlurEffect()
        setupGradientLayer()
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
        
        propertyAnimator?.fractionComplete = 0.0
    }
    
    private func setupGradientLayer() {
        addSubview(gradientContainerView)
        
        gradientContainerView.anchor(
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.48, 1.0]
        gradientLayer.frame = bounds
        gradientLayer.frame.origin.y -= bounds.height
        
        gradientContainerView.layer.addSublayer(gradientLayer)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8.0
        
        addSubview(stackView)
        
        stackView.anchor(
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 0.0, left: padding, bottom: padding, right: padding)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
}
