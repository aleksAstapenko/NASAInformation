//
//  Date+Extension.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 5.10.25.
//

import Foundation

extension Date {
    func formatedDate() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}

