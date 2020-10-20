import Foundation
import SwiftUI

class TrainingProgramViewModel: ObservableObject {
    @Published var trainingPrograms: Program
    
    init() {
        let program = Program()
        program.items = [TrainingProgram.init(name: "Test", exercises: [Exercise(name: "Hej", category: .arms, trainTogether: true, log: [Log.init(left: 20, right: 23, time: 1111)])])]
        self.trainingPrograms = program
    }
}
