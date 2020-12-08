import SwiftUI

// Inspiration fra: https://medium.com/better-programming/how-to-draw-beautifully-animated-graphs-in-swiftui-part-1-8688c38a2db0

struct BarChartItem: View {
    var value: Int
    var maxValue: Int
    var width: CGFloat = 30
    var valueName: String
    var barColor: Color = .blackWhite
    var height : CGFloat = 400
    var fullHeight = true
    
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .fill(Color.gray)
                    .opacity(0.1)
                    .frame(width: width, height: (fullHeight ? height : height/2))
                VStack {
                    CustomTextLabel(text: "\(value)")
                    Capsule()
                        .fill(barColor)
                        .frame(width: width, height: CGFloat(value) / CGFloat(maxValue) * (fullHeight ? height : height/2))
                        .animation(.easeOut(duration: 0.5))
                }
               
            }
            CustomTextLabel(text: valueName)
        }
    }
}

struct BarChartItem_Previews: PreviewProvider {
    static var previews: some View {
        BarChartItem(value: 30, maxValue: 50, width: 50, valueName: "Val text")
    }
}

struct ColorRGB {
    var red: Double
    var green: Double
    var blue: Double
}
