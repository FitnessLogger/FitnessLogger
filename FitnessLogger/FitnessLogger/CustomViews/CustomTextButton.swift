import SwiftUI

struct CustomTextButton: View {
    
    let action: () -> Void
    let label: String
    let isClear : Bool
    let fontSize : CGFloat?
    
    init(action: @escaping () -> Void, label: String, isClear: Bool = false, fontSize: CGFloat? = nil) {
        self.action = action
        self.label = label
        self.isClear = isClear
        self.fontSize = fontSize
    }
    
    var body: some View {
        CustomButton(action: {
            self.action()
        }, label: Text(label)
            .foregroundColor(isClear ? Color.blackWhite : Color.whiteBlack)
            .font(.custom(Font.oswaldMedium, size: fontSize != nil ? fontSize! : FontSize.button)), isClear: isClear)
    }
}
