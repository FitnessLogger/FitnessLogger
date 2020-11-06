import Foundation
import SwiftUI

struct AddTrainingProgramView: View {
    @ObservedObject private var vm: AddTrainingProgramViewModel
    @Binding var showingAddProgramSheet: Bool
    @State var uploadingState : UploadingState = .passiv
    
    init(viewmodel: AddTrainingProgramViewModel, show: Binding<Bool>) {
        self.vm = viewmodel
        self._showingAddProgramSheet = show
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                TextField("Enter program name", text: self.$vm.name)
                    .font(.custom(Font.oswaldHeavy, size: 30))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                if self.vm.currentTrainingProgram.exercises.isEmpty {
                    CustomTextLabel(text: "You have no exercises in this program. Click the button below to create your exercises.", alignment: .center)
                } else {
                    List(self.vm.currentTrainingProgram.exercises) { exercise in
                        ExerciseItem(exercise: exercise)
                    }
                }
                
                Spacer()
                
                CustomTextButton(action: {
                    self.vm.showAddExercise.toggle()
                }, label: self.vm.currentTrainingProgram.exercises.isEmpty ? "Add exercise" : "Add more exercises")
                .padding([.leading, .trailing], 8)
                .sheet(isPresented: self.$vm.showAddExercise) {
                    let viewmodel = AddExerciseViewModel(trainingProgram: self.vm.currentTrainingProgram)
                    AddExerciseView(viewmodel: viewmodel, show: self.$vm.showAddExercise)
                }
            }.padding()
            .navigationBarTitle(Text("Add program"), displayMode: .inline)
            .navigationBarItems(
                leading:
                    UploadingView(state: self.uploadingState)
                ,
                trailing: Button(action: {
                    self.uploadingState = .uploading
                    self.vm.saveTrainingProgram { success in
                        if success {
                            self.uploadingState = .success
                            Utility.delay(delayInSeconds: 1) {
                                self.showingAddProgramSheet.toggle()
                            }
                        }
                        else {
                            self.uploadingState = .failure
                        }
                     }
            }) {
                Text("Save").bold()
            })
        }
    }
}
