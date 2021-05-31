//
//  StringExtension.swift
//  Core
//
//  Created by MacBook on 30/05/21.
//

import Foundation
public extension String {
    var getCurrentDate: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "EN")
        formatter.dateFormat = "dd MMM yyyy - HH:mm"
        return formatter.string(from: date)
    }
}

