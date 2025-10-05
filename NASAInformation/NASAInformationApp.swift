//
//  NASAInformationApp.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 25.09.25.
//

import SwiftUI

@main
struct NASAInformationApp: App {
    let serviceLocator = ServiceLocator.shared
    let getService: () = PhotoOfDayServices.init().registerAllSerives()
    var body: some Scene {
        WindowGroup {
            AnimatedSplashView()
        }
    }
}
