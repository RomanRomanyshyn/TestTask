//
//  NSLayoutConstraint+Extension.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import UIKit

extension NSLayoutConstraint {
    static func add(_ views: UIView..., to parent: UIView, constraints: [NSLayoutConstraint]) {
        views.forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            parent.addSubview($0)
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    static func add(_ view: UIView, to parent: UIView, inset: UIEdgeInsets) {
        add(view, to: parent, constraints: [
            view.topAnchor.constraint(equalTo: parent.topAnchor, constant: inset.top),
            view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: inset.left),
            view.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: inset.right),
            view.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: inset.bottom)
        ])
    }
    
    static func addWithSafeArea(_ view: UIView, to parent: UIView, inset: UIEdgeInsets) {
        add(view, to: parent, constraints: [
            view.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: inset.top),
            view.leadingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.leadingAnchor, constant: inset.left),
            view.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor, constant: inset.right),
            view.bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: inset.bottom)
        ])
    }
}
