import Foundation
import SwiftUI

struct ProgramDetailView: View {
    var trainingProgram: TrainingProgram
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack {
            List(trainingProgram.exercises) { exercise in
                Button("", action: {
                    print(exercise.name)
                    self.showSheet.toggle()
                })
                ExerciseDetailItem(exercise: exercise)
            }.sheet(isPresented: self.$showSheet) {
                Text("Hello world")
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
