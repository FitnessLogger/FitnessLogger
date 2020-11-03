import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            BlurView()
            
            VStack {
                LottieView(filename: "treadmill", loopMode: .loop).frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                CustomTextLabel(text: "Loading...", fontType: .heading)
            }
            
            
            
        }
        .frame(width: 350, height: 350, alignment: .center)
        .cornerRadius(30)
        .shadow(radius: 30)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
