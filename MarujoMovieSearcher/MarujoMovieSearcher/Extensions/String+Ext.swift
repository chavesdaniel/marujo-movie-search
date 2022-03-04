//
//  String+Ext.swift
//  MarujoMovieSearcher
//
//  Created by Daniel on 04/03/22.
//

import Foundation

extension String {
    func convertToDate() -> Date? {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "yyyy-MM-dd"
        dateFormatter.locale        = Locale(identifier: "pt_BR")
        dateFormatter.timeZone      = .current
        
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "-" }
        return date.convertToDayMonthYear()
    }
}
