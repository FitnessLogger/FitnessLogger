import Foundation
import SwiftUI

struct AddTrainingProgramView: View {
    @ObservedObject private var vm: AddTrainingProgramViewModel
    @Binding var showingAddProgramSheet: Bool
    
    init(viewmodel: AddTrainingProgramViewModel, show: Binding<Bool>) {
        self.vm = viewmodel
        self._showingAddProgramSheet = show
    }
    
//    @State var showingAddExercise = false
//    @State private var name: String = ""
    
    // ViewModel that includes all training models
    // When a training model is created in this view - it should be added here
//    var vm: TrainingProgramViewModel
    
    // Create an empty object of TrainingProgram if the list is empty
//    @ObservedObject var trainingProgram: TrainingProgram = TrainingProgram.init(name: "", exercises: [])

    var body: some View {
        NavigationView {
            VStack {
//                TextField("Enter program name", text: self.vm.$name)
//                Spacer()
//
//                if self.trainingProgram.exercises.isEmpty {
//                    Button("Add exercise", action: {
//                        self.vm.$showAddExercise.toggle()
//                    }).sheet(isPresented: self.vm.$showAddExercise) {
//                        AddExerciseView(showingAddExercise: self.$showingAddExercise, trainingProgram: self.trainingProgram)
//                    }
//
//                    Spacer()
//                } else {
//                    List(self.vm.trainingProgram.exercises) { exercise in
//                        ExerciseItem(exercise: exercise)
//                    }
//
//                    Spacer()
//
//                    Button("Add more exercise", action: {
//                        self.showingAddExercise.toggle()
//                    }).sheet(isPresented: self.vm.$showAddExercise) {
//                        AddExerciseView(showingAddExercise: self.$showingAddExercise, trainingProgram: self.trainingProgram)
//                    }.padding()
//                }
                
                
                
                TextField("Enter program name", text: self.$vm.name)
                Spacer()
                
                
                if self.vm.currentTrainingProgram.exercises.isEmpty {
                    Button("Add exercise", action: {
                        self.vm.showAddExercise.toggle()
                    })
                    .sheet(isPresented: self.$vm.showAddExercise) {
                        // Create viewmodel and open view
                        AddExerciseView(showingAddExercise: self.$vm.showAddExercise, trainingProgram: self.vm.currentTrainingProgram)
                    }
                    
                    Spacer()
                } else {
                    List(self.vm.currentTrainingProgram.exercises) { exercise in
                        // Create viewmodel for exercise and show
                    }
                    
                    Spacer()
                    
                    Button("Add more exercises", action: {
                        self.vm.showAddExercise.toggle()
                    }).sheet(isPresented: self.$vm.showAddExercise) {
                        // Create viewmodel and show view
                        AddExerciseView(showingAddExercise: self.$vm.showAddExercise, trainingProgram: self.vm.currentTrainingProgram)
                    }
                }
            }.padding()
            .navigationBarTitle(Text("Add program"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
//                self.trainingProgram.name = self.name
//                self.vm.trainingPrograms.append(self.trainingProgram)
//                self.showingAddProgramSheet = false
            }) {
                Text("Save").bold()
            })
        }
    }
}
