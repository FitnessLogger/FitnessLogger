import SwiftUI

struct UploadingView: View {
    
    let state : UploadingState
    
    var animationFile : String {
        print("State: \(state)")
        switch state {
        case .success:
            return "success"
        case .failure:
            return "failure"
        case .uploading:
            return "uploading"
        default:
            return ""
        }
    }
    
    var body: some View {
        Group {
            if self.state != .passiv {
                LottieView(filename: self.animationFile,loopMode: self.state == .uploading ? .loop : .playOnce).frame(width: 50, height: 50, alignment: .leading)
            }
            else {
                Text("")
            }
        }
    }
}

struct UploadingView_Previews: PreviewProvider {
    static var previews: some View {
        UploadingView(state: .uploading)
    }
}
