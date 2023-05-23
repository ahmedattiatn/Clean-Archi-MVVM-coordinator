//
//  String+localized.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Foundation
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "\(self)_comment")
    }
}
