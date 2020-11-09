import Foundation
import SwiftUI

struct ExerciseItem: View {
    var exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomTextLabel(text: exercise.name, fontType: .heading)
            CustomTextLabel(text: exercise.category.rawValue)
        }
    }
}
