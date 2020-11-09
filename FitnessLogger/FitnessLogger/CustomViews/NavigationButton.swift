import Foundation
import SwiftUI

struct NavigationButton<UDestination : View>: View {
    
    let destination : UDestination
    let content : String
    let isClear : Bool
    
    init(destination: UDestination, content: String, isClear : Bool = false) {
        self.destination = destination
        self.content = content
        self.isClear = isClear
    }
    
    var body: some View {
        CustomNavigationButton(destination: destination, content: {
            Text(content)
                .foregroundColor(isClear ? Color.blackWhite : Color.whiteBlack)
                .font(.custom(Font.oswaldMedium, size: FontSize.button))
        }, color: isClear ? Color.clear : Color.blackWhite)
    }
}
