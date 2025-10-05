//
//  View+Loader.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 5.10.25.
//

import SwiftUI

extension View {
    func loading(_ isLoading: Bool, _ text: String) -> some View {
        self.modifier(LoadingModifier(isLoading: isLoading, text: text))
    }
}
