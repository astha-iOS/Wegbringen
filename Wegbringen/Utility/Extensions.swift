//
//  Extensions.swift
//  Wegbringen
//
//  Created by Astha yadav on 23/11/21.
//

import Foundation

extension String {
    func containsIgnoreCase(target: String) -> Bool {
        return self.lowercased().contains(target.lowercased())
    }
}
