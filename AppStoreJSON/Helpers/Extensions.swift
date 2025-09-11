//
//  Extensions.swift
//  AppStoreJSON
//
//  Created by John Padilla on 7/23/25.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}
