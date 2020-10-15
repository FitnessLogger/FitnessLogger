import Foundation
import SwiftUI

struct ProgramDetailView: View {
    @State var showSheet: Bool = false
    @ObservedObject private var vm: ProgramDetailViewModel
    
    init(viewmodel: ProgramDetailViewModel) {
        self.vm = viewmodel
    }
    
    var body: some View {
        VStack {
            List(self.vm.trainingProgram.exercises) { exercise in
                Button("", action: {
                    self.vm.exercise = exercise
                    self.showSheet.toggle()
                })
                ExerciseDetailItem(exercise: exercise)
            }.sheet(isPresented: self.$showSheet) {
                let vm = UpdateExerciseLogViewModel(with: self.vm.exercise!)
                UpdateExerciseLogView(with: vm, show: self.$showSheet)
            }
        }
        .navigationBarTitle(Text(self.vm.trainingProgram.name))
        .navigationBarItems(trailing: Button(action: {
            print("Edit pressed")
        }) {
            Text("Edit").bold()
        })
    }
}
