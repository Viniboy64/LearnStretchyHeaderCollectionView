//
//  UIView.swift
//  LearnStretchyHeaderCollectionView
//
//  Created by Marcus Vinícius on 26/10/19.
//  Copyright © 2019 Marcus Vinícius. All rights reserved.
//

import UIKit

extension UIView {
    public struct AnchoredConstraints {
        var top: NSLayoutConstraint?
        var leading: NSLayoutConstraint?
        var bottom: NSLayoutConstraint?
        var trailing: NSLayoutConstraint?
        var centerX: NSLayoutConstraint?
        var centerY: NSLayoutConstraint?
        var width: NSLayoutConstraint?
        var height: NSLayoutConstraint?
    }
    
    public func addSubview(_ views: [UIView]) {
        views.forEach { (view) in
            self.addSubview(view)
        }
    }
    
    @discardableResult
    public func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero
    ) -> AnchoredConstraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        
        if let topAnchor = top {
            anchoredConstraints.top = self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top)
        }
        
        if let leadingAnchor = leading {
            anchoredConstraints.leading = self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left)
        }
        
        if let bottomAnchor = bottom {
            anchoredConstraints.bottom = self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom)
        }
        
        if let trailingAnchor = trailing {
            anchoredConstraints.trailing = self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = self.widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = self.heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [
            anchoredConstraints.top,
            anchoredConstraints.leading,
            anchoredConstraints.bottom,
            anchoredConstraints.trailing,
            anchoredConstraints.width,
            anchoredConstraints.height
        ].forEach { $0?.isActive = true }
        
        return anchoredConstraints
    }
}
