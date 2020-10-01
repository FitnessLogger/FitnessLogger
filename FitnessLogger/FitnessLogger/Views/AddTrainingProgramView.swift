import Foundation
import SwiftUI

struct AddTrainingProgramView: View {
    @Binding var showingAddProgramSheet: Bool
    @Binding var trainedSeparately: Bool
    @State var showingAddExercise = false
    @State private var name: String = ""
    
    // ViewModel that includes all training models
    // When a training model is created in this view - it should be added here
    var trainingProgramViewModel: TrainingProgramViewModel
    
    // Create an empty object of TrainingProgram if the list is empty
    @ObservedObject var trainingProgram: TrainingProgram = TrainingProgram.init(name: "", exercises: [])

    var body: some View {
        NavigationView {
            VStack {
                if self.trainingProgram.exercises.isEmpty {
                    TextField("Enter program name", text: $name)
                    
                    Spacer()
                    
                    Button("Add exercise", action: {
                        self.showingAddExercise.toggle()
                    }).sheet(isPresented: $showingAddExercise) {
                        AddExerciseView(showingAddExercise: self.$showingAddExercise, trainedSeparately: self.$trainedSeparately, trainingProgram: self.trainingProgram)
                    }
                    
                    Spacer()
                } else {
                    List(trainingProgram.exercises) { exercise in
                        ExerciseItem(exercise: exercise)
                    }
                    
                    Spacer()
                    
                    Button("Add more exercise", action: {
                        self.showingAddExercise.toggle()
                    }).sheet(isPresented: $showingAddExercise) {
                        AddExerciseView(showingAddExercise: self.$showingAddExercise, trainedSeparately: self.$trainedSeparately, trainingProgram: self.trainingProgram)
                    }.padding()
                }
            }.padding()
            .navigationBarTitle(Text("Add program"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.trainingProgram.name = self.name
                self.trainingProgramViewModel.trainingPrograms.append(self.trainingProgram)
                self.showingAddProgramSheet = false
            }) {
                Text("Save").bold()
            })
        }
    }
}
