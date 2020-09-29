import Foundation
import SwiftUI

struct TrainingProgramItem: View {
    var trainingProgram: TrainingProgram
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(trainingProgram.name)
            Text("\(trainingProgram.exercises.count) exercises")
        }
    }
}
