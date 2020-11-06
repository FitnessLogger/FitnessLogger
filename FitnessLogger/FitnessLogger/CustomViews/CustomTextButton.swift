import SwiftUI

struct CustomTextButton: View {
    
    let action: () -> Void
    let label: String
    let isClear : Bool
    
    init(action: @escaping () -> Void, label: String, isClear: Bool = false) {
        self.action = action
        self.label = label
        self.isClear = isClear
    }
    
    var body: some View {
        CustomButton(action: {
            self.action()
        }, label: Text(label)
            .foregroundColor(isClear ? Color.blackWhite : Color.whiteBlack)
            .font(.custom(Font.oswaldMedium, size: FontSize.button)), isClear: isClear)
    }
}
