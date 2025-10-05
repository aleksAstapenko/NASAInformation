//
//  MainTabItem.swift
//  Homework1
//
//  Created by Александр Астапенко on 5.09.25.
//
import SwiftUI

enum MainTabItem: Int {
    case firstTab
    case secondTab
    case thirdTab
    case forthTab
    
    var image: Image {
        switch self {
        case .firstTab:
            return Image(systemName: "1.circle")
        case .secondTab:
            return Image(systemName: "2.circle")
        case .thirdTab:
            return Image(systemName: "3.circle")
        case .forthTab:
            return Image(systemName: "4.circle")
        }
    }
    
    var title: String {
        switch self {
        case .firstTab:
            return "Фото дня"
        case .secondTab:
            return "Second page"
        case .thirdTab:
            return "Third page"
        case .forthTab:
            return "Forth page"
        }
    }
}
