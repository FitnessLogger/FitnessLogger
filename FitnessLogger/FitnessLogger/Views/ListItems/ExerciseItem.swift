import Foundation
import SwiftUI

struct ExerciseItem: View {
    var exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(exercise.name)
            Text(exercise.category.rawValue)
        }
    }
}
