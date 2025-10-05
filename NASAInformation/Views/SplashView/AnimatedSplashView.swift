import SwiftUI
import Lottie

struct AnimatedSplashView: View {
    @State private var isActive = false
    @State private var animationFinished = false
    @StateObject private var state: AppState = .init()

    var body: some View {
        if isActive {
            MainTabView().environmentObject(state)
        } else {
            ZStack {
                Color.white.ignoresSafeArea()
                    LottieView(animationView: LottieAnimationView(name: "NASAWormLogo", bundle: .main))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
            }
        }
    }
}

struct LottieView: UIViewRepresentable {
    let animationView: LottieAnimationView

    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        animationView.frame = view.bounds
        animationView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
