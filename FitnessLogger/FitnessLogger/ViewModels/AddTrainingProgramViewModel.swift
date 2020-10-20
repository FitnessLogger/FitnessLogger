import Foundation
import SwiftUI

class AddTrainingProgramViewModel: ObservableObject {
    @Published var trainingPrograms: Program?
    @Published var currentTrainingProgram: TrainingProgram
    @Published var name: String
    @Published var showAddExercise: Bool = false
    
    init(trainingProgram: TrainingProgram) {
        self.currentTrainingProgram = trainingProgram
        self.name = trainingProgram.name
    }
    
    init(program: Program) {
        self.currentTrainingProgram = TrainingProgram(name: "", exercises: [])
        self.name = ""
        self.trainingPrograms = program
    }
    
    func saveTrainingProgram() {
        currentTrainingProgram.name = self.name
        self.trainingPrograms?.append(trainingProgram: currentTrainingProgram)
    }
}
