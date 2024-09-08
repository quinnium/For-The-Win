//
//  Date+Ext.swift
//  ForTheWin
//
//  Created by Quinn on 08/09/2024.
//

import Foundation

extension Date {
    func addingDays(_ number: Int) -> Date? {
        Calendar.current.date(byAdding: .day, value: number, to: self)
    }
}
