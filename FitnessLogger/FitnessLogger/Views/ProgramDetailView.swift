import Foundation
import SwiftUI

struct ProgramDetailView: View {
    var trainingProgram: TrainingProgram
    
    var body: some View {
        VStack {
            List(trainingProgram.exercises) { exercise in
                ExerciseDetailItem(exercise: exercise)
            }
        }
        .navigationBarTitle(Text(self.trainingProgram.name))
        .navigationBarItems(trailing: Button(action: {
            print("Edit pressed")
        }) {
            Text("Edit").bold()
        })
    }
}
