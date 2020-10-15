import Foundation
import SwiftUI

struct ProgramDetailView: View {
    var trainingProgram: TrainingProgram
    @State var showSheet: Bool = false
    @State var globalExercise: Exercise
    
    var body: some View {
        VStack {
            List(trainingProgram.exercises) { exercise in
                Button("", action: {
                    globalExercise = exercise
                    self.showSheet.toggle()
                })
                ExerciseDetailItem(exercise: exercise)
            }.sheet(isPresented: self.$showSheet) {
                if !globalExercise.trainTogether {
                    if let left = globalExercise.log.first?.left {
                        UpdateExerciseLogView(showSheet: self.$showSheet, left: left, right: 0, exercise: globalExercise)
                    } else {
                        UpdateExerciseLogView(showSheet: self.$showSheet, left: 0, right: 0, exercise: globalExercise)
                    }
                } else {
                    if let left = globalExercise.log.first?.left, let right = globalExercise.log.first?.right {
                        UpdateExerciseLogView(showSheet: self.$showSheet, left: left, right: right, exercise: globalExercise)
                    } else {
                        UpdateExerciseLogView(showSheet: self.$showSheet, left: 0, right: 0, exercise: globalExercise)
                    }
                }
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
