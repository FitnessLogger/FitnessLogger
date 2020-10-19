import Foundation
import SwiftUI

struct AddTrainingProgramView: View {
    @ObservedObject private var vm: AddTrainingProgramViewModel
    @Binding var showingAddProgramSheet: Bool
    
    init(viewmodel: AddTrainingProgramViewModel, show: Binding<Bool>) {
        self.vm = viewmodel
        self._showingAddProgramSheet = show
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter program name", text: self.$vm.name)
                Spacer()
                
                
                if self.vm.currentTrainingProgram.exercises.isEmpty {
                    Button("Add exercise", action: {
                        self.vm.showAddExercise.toggle()
                    })
                    .sheet(isPresented: self.$vm.showAddExercise) {
                        let viewmodel = AddExerciseViewModel(trainingProgram: self.vm.currentTrainingProgram)
                        AddExerciseView(viewmodel: viewmodel, show: self.$vm.showAddExercise)
                    }
                    
                    Spacer()
                } else {
                    List(self.vm.currentTrainingProgram.exercises) { exercise in
                        ExerciseItem(exercise: exercise)
                    }
                    
                    Spacer()
                    
                    Button("Add more exercises", action: {
                        self.vm.showAddExercise.toggle()
                    }).sheet(isPresented: self.$vm.showAddExercise) {
                        let viewmodel = AddExerciseViewModel(trainingProgram: self.vm.currentTrainingProgram)
                        AddExerciseView(viewmodel: viewmodel, show: self.$vm.showAddExercise)
                        
                    }
                }
            }.padding()
            .navigationBarTitle(Text("Add program"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.vm.saveTrainingProgram()
                // It needs to be apended
                self.showingAddProgramSheet.toggle()
            }) {
                Text("Save").bold()
            })
        }
    }
}
