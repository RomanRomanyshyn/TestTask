//
//  UIEdgeInsets+Extension.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import UIKit

extension UIEdgeInsets {
    init(top: CGFloat = .zero, leading: CGFloat = .zero, bottom: CGFloat = .zero, trailing: CGFloat = .zero) {
        self.init()
        self.top = top
        self.left = leading
        self.bottom = -bottom
        self.right = -trailing
    }
    
    init(all inset: CGFloat) {
        self.init(top: inset, leading: inset, bottom: inset, trailing: inset)
    }
    
    /// Only horizontal insets
    /// - Parameter inset: leading and trailing insets
    init(horizontal inset: CGFloat) {
        self.init(leading: inset, trailing: inset)
    }
    
    /// Only vertical insets
    /// - Parameter inset: top and bottom insets
    init(vertical inset: CGFloat) {
        self.init(top: inset, bottom: inset)
    }
    
    static var zero: UIEdgeInsets {
        UIEdgeInsets(all: .zero)
    }
}
