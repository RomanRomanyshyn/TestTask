//
//  UIStackView+Extension.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import UIKit

extension UIStackView {
    static var horizontal: UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }
    
    static var vertical: UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }
    
    @discardableResult
    func addArrangedSubviews(_ views: UIView...) -> Self {
        views.forEach(addArrangedSubview)
        return self
    }
    
    @discardableResult
    func addArrangedSubviews(_ views: [UIView]) -> Self {
        views.forEach(addArrangedSubview)
        return self
    }
    
    func subviewWidth(_ index: Int, multiplier: CGFloat, constant: CGFloat = .zero) {
        arrangedSubviews[index].widthAnchor.constraint(equalTo: widthAnchor, multiplier: multiplier, constant: constant).isActive = true
    }
}
