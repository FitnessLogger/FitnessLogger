import Foundation
import SwiftUI

struct AddTrainingProgramView: View {
    @ObservedObject private var vm: AddTrainingProgramViewModel
    @Binding var showingAddProgramSheet: Bool
    @State var something : UploadingState = .passiv
    
    init(viewmodel: AddTrainingProgramViewModel, show: Binding<Bool>) {
        self.vm = viewmodel
        self._showingAddProgramSheet = show
    }
    
    var animationFile : String {
        print("Trying to get animation")
        print("State: \(something)")
        switch something {
        case .success:
            return "success"
        case .failure:
            return "failure"
        case .uploading:
            return "uploading"
        default:
            return ""
        }
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
            .navigationBarItems(
                leading:
                    UploadingView(state: self.something)
                ,
                trailing: Button(action: {
                    self.something = .uploading
                    self.vm.saveTrainingProgram { success in
                        if success {
                            self.something = .success
                            Utility.delay(delayInSeconds: 1) {
                                self.showingAddProgramSheet.toggle()
                            }
                        }
                        else {
                            self.something = .failure
                        }
//                        self.something = .passiv
                    }
            }) {
                Text("Save").bold()
            })
        }
    }
}
