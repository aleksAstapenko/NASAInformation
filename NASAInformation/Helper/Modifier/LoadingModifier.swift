//
//  LoadingModifier.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 5.10.25.
//

import SwiftUI

struct LoadingModifier: ViewModifier {
    let isLoading: Bool
    let text: String?
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(isLoading)
                .opacity(isLoading ? 0.3 : 1.0)
            
            if isLoading {
                ProgressView(text ?? "")
                    .scaleEffect(1.2)
                    .tint(.black)
                    .font(.headline)
            }
        }
    }
}
