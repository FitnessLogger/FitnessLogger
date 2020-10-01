import Foundation
import SwiftUI

struct AddExerciseView: View {
    @Binding var showingAddExercise: Bool
    @Binding var trainedSeparately: Bool
    @State var exerciseName: String = ""
    
    var trainingProgram: TrainingProgram
    
    let strings = ["this", "is", "a", "test"]
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Exercise name", text: $exerciseName)
                
                List(strings, id: \.self) { string in
                    Text(string)
                }
                
                
                Toggle("Trained separately", isOn: self.$trainedSeparately)
                
                Spacer()
                
                Button("Save", action: {
                    let exercise: Exercise = Exercise(name: self.exerciseName, category: .arms, trainTogether: false, log: [])
                    self.trainingProgram.exercises.append(exercise)
                    self.showingAddExercise = false
                })
                
            }.padding()
            .navigationBarTitle(Text("Add Exercise"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showingAddExercise = false
                }) {
                    Text("Done").bold()
                })
        }
    }
}

