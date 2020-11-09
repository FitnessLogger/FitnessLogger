import SwiftUI

struct CustomNavigationButton<UDestination : View, Content : View>: View {
    
    let destination : UDestination
    let content : Content
    let color : Color

    init(destination: UDestination, @ViewBuilder content: () -> Content, color: Color) {
        self.destination = destination
        self.content = content()
        self.color = color
    }
    
    var body: some View {
        NavigationLink(destination: self.destination) {
            self.content
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(self.color)
                .cornerRadius(5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
