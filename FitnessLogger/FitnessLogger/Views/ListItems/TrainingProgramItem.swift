import Foundation
import SwiftUI

struct TrainingProgramItem: View {
    var trainingProgram: TrainingProgram
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomTextLabel(text: trainingProgram.name, fontType: .heading)
            CustomTextLabel(text: "\(trainingProgram.exercises.count) \(trainingProgram.exercises.count > 1 ? "exercises" : "exercise")")
        }
    }
}
