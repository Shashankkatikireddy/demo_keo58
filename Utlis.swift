//
//  Utlis.swift
//  Currencyproject
//
//  Created by Macbook air  on 25/08/2023.
//

import Foundation

extension String {
    static let numberformater = NumberFormatter()
    var doubleValue: Double {
        String.numberformater.decimalSeparator = "."
        if let result = String.numberformater.number(from: self) {
            return result.doubleValue
        } else {
            String.numberformater.decimalSeparator = ","
            if let result = String.numberformater.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
}
