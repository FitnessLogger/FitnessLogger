import Foundation
import SwiftUI
import Lottie

// Lånt og modificeret fra: https://www.hackingwithswift.com/forums/swiftui/how-to-switch-animations-with-lottie-in-swiftui/1704
struct LottieView : UIViewRepresentable {

    let animationView = AnimationView()
    var filename : String
    var loopMode : LottieLoopMode = .playOnce
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        
        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = self.loopMode
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate(
            [animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
             animationView.widthAnchor.constraint(equalTo: view.widthAnchor)])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        animationView.play()
    }
    
}
