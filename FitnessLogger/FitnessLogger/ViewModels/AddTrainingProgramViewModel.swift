import Foundation
import SwiftUI

class AddTrainingProgramViewModel: ObservableObject {
    @Published var trainingPrograms: [TrainingProgram]?
    @Published var currentTrainingProgram: TrainingProgram
    @Published var name: String
    @Published var showAddExercise: Bool = false
    
    init(trainingProgram: TrainingProgram) {
        self.currentTrainingProgram = trainingProgram
        self.name = trainingProgram.name
    }
    
    init(programs: [TrainingProgram]) {
        self.currentTrainingProgram = TrainingProgram(name: "", exercises: [])
        self.name = ""
        self.trainingPrograms = programs
    }
    
    func saveTrainingProgram() {
        currentTrainingProgram.name = self.name
        self.trainingPrograms?.append(currentTrainingProgram)
    }
}
