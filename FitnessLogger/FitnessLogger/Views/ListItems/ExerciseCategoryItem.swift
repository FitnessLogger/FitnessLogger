import SwiftUI

struct ExerciseCategoryItem: View {
    
    @Binding var selectedItem : TrainingCategory
    var trainingCategory : TrainingCategory
    
    var isChecked : Bool {
        return selectedItem == trainingCategory
    }
    
    var body: some View {
        HStack {
            Button(action: {
                if selectedItem != trainingCategory {
                    selectedItem = trainingCategory
                }
            }, label: {
                Text("\(trainingCategory.toString())")
            })
            
            Spacer()
            
            LottieView(filename: "check-mark").frame(width: 40, height: 40, alignment: .center).isHidden(!isChecked)
        }
        
        
    }
}


// lånt fra : https://stackoverflow.com/questions/56490250/dynamically-hiding-view-in-swiftui
extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
