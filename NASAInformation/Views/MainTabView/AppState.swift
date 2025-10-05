//
//  AppState.swift
//  Homework1
//
//  Created by Александр Астапенко on 5.09.25.
//

import Combine

final class AppState: ObservableObject {
    @Published var mainTab = MainTabItem.firstTab
    
    let itemsOnTab: [MainTabItem] = [.firstTab, .secondTab, .thirdTab, .forthTab]
    
    init() {
    }
}
