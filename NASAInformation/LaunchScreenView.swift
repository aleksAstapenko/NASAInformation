//
//  LaunchScreenView.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 25.09.25.
//

import SwiftUI

struct AnimatedSplashView: View {
    // State для управления анимацией
    @State private var isActive = false
    @State private var scale: CGFloat = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            // Здесь ваш главный экран приложения
            ContentView()
        } else {
            // Ваш анимированный экран загрузки
            ZStack {
                Color(.systemBackground) // Адаптивный цвет фона
                    .ignoresSafeArea()

                Image("logo") // Ваше лого или любое другое изображение
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .scaleEffect(scale)
                    .opacity(opacity)
            }
            .onAppear {
                // Запускаем анимацию при появлении view
                withAnimation(.easeInOut(duration: 1.5)) {
                    self.scale = 1.2
                    self.opacity = 1.0
                }

                // Переключаемся на основное приложение после задержки
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
