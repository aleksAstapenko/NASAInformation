//
//   PhotoOfDayDetailed.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 5.10.25.
//
import SwiftUI

struct PhotoOfDayDetailed: View {
    var detailedInformation: GetPhotoOfDayResponse?
    @State private var isTabBarHidden = true
    var body: some View {
        ScrollView {
            LazyVStack {
                CachedAsyncImage(urlString: detailedInformation?.url ?? "")
                    .frame(width: 300, height: 300)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                Text(detailedInformation?.explanation ?? "")
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                    .font(.footnote)
            }
        }
        .navigationTitle(detailedInformation?.title ?? "")
        .font(.title)
        .toolbar(isTabBarHidden ? .hidden : .visible, for: .tabBar)
                .onAppear {
                    isTabBarHidden = true
                }
                .onDisappear() {
                    isTabBarHidden = false
                }
    }
}
