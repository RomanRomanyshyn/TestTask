//
//  UILabel+Extension.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import UIKit

extension UILabel {
    func text(_ text: String) -> UILabel {
        self.update {
            $0.text = text
        }
    }
}
