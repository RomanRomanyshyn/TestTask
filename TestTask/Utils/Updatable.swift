//
//  Updatable.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import Foundation

protocol Updatable {}
extension Updatable {
    func update(_ block: (Self)-> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Updatable{}
