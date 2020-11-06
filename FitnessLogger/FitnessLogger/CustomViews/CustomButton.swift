import SwiftUI

struct CustomButton<Label>: View where Label : View {
    
    let action: () -> Void
    let label: Label
    let isClear : Bool
    
    init(action: @escaping () -> Void, label: Label, isClear: Bool = false) {
        self.action = action
        self.label = label
        self.isClear = isClear
    }
    
    var body: some View {
        Button(action: self.action) {
            self.label
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(isClear ? Color.clear : Color.blackWhite)
                .cornerRadius(5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
