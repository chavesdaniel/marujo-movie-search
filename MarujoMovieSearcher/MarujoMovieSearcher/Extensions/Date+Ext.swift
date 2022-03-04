//
//  Date+Ext.swift
//  MarujoMovieSearcher
//
//  Created by Daniel on 04/03/22.
//

import Foundation

extension Date {
    func convertToDayMonthYear() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "d MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
