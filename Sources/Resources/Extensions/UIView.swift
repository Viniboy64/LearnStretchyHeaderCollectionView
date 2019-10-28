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
    
    public func addSubviews(_ views: [UIView]) {
        views.forEach { (view) in
            self.addSubview(view)
        }
    }
    
    @discardableResult
    public func fillSuperview(
        padding: UIEdgeInsets = .zero
    ) -> AnchoredConstraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let anchoredConstraints = AnchoredConstraints()
        
        guard
            let superviewTopAnchor = superview?.topAnchor,
            let superviewLeadingAnchor = superview?.leadingAnchor,
            let superviewBottomAnchor = superview?.bottomAnchor,
            let superviewTrailingAnchor = superview?.trailingAnchor
        else {
            return anchoredConstraints
        }
        
        return anchor(
            top: superviewTopAnchor,
            leading: superviewLeadingAnchor,
            bottom: superviewBottomAnchor,
            trailing: superviewTrailingAnchor,
            padding: padding
        )
        
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
    
    @discardableResult
    public func constraintWidth(_ constant: CGFloat) -> AnchoredConstraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraint = AnchoredConstraints()
        anchoredConstraint.width = self.widthAnchor.constraint(equalToConstant: constant)
        anchoredConstraint.width?.isActive = true
        
        return anchoredConstraint
    }
    
    @discardableResult
    public func constraintWidth(_ dimension: NSLayoutDimension) -> AnchoredConstraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraint = AnchoredConstraints()
        anchoredConstraint.width = self.widthAnchor.constraint(equalTo: dimension)
        anchoredConstraint.width?.isActive = true
        
        return anchoredConstraint
    }
    
    @discardableResult
    public func constraintHeight(_ constant: CGFloat) -> AnchoredConstraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraint = AnchoredConstraints()
        anchoredConstraint.width = self.widthAnchor.constraint(equalToConstant: constant)
        anchoredConstraint.width?.isActive = true
        
        return anchoredConstraint
    }
    
    @discardableResult
    public func constraintHeight(_ dimension: NSLayoutDimension) -> AnchoredConstraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraint = AnchoredConstraints()
        anchoredConstraint.height = self.heightAnchor.constraint(equalTo: dimension)
        anchoredConstraint.height?.isActive = true
        
        return anchoredConstraint
    }
    
    @discardableResult
    public func centeredAnchor(
        centerX: NSLayoutXAxisAnchor?,
        centerY: NSLayoutYAxisAnchor?,
        width: CGFloat,
        height: CGFloat
    ) -> AnchoredConstraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        
        if let centerXAnchor = centerX {
            anchoredConstraints.centerX = self.centerXAnchor.constraint(equalTo: centerXAnchor)
        }
        
        if let centerYAnchor = centerY {
            anchoredConstraints.centerY = self.centerYAnchor.constraint(equalTo: centerYAnchor)
        }
        
        anchoredConstraints.width = self.widthAnchor.constraint(equalToConstant: width)
        anchoredConstraints.height = self.heightAnchor.constraint(equalToConstant: height)
        
        [
            anchoredConstraints.centerX,
            anchoredConstraints.centerY,
            anchoredConstraints.width,
            anchoredConstraints.height
        ].forEach { $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    @discardableResult
    public func centeredAnchor(
        centerX: NSLayoutXAxisAnchor?,
        centerY: NSLayoutYAxisAnchor?,
        width: NSLayoutDimension,
        height: NSLayoutDimension
    ) -> AnchoredConstraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        
        if let centerXAnchor = centerX {
            anchoredConstraints.centerX = self.centerXAnchor.constraint(equalTo: centerXAnchor)
        }
        
        if let centerYAnchor = centerY {
            anchoredConstraints.centerY = self.centerYAnchor.constraint(equalTo: centerYAnchor)
        }
        
        anchoredConstraints.width = self.widthAnchor.constraint(equalTo: width)
        anchoredConstraints.height = self.heightAnchor.constraint(equalTo: height)
        
        [
            anchoredConstraints.centerX,
            anchoredConstraints.centerY,
            anchoredConstraints.width,
            anchoredConstraints.height
        ].forEach { $0?.isActive = true }
        
        return anchoredConstraints
    }
}
