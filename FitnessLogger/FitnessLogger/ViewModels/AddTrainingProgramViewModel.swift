import Foundation
import SwiftUI

class AddTrainingProgramViewModel: ObservableObject {
    @Published var currentTrainingProgram: TrainingProgram
    @Published var name: String
    @Published var showAddExercise: Bool = false
    
    init(trainingProgram: TrainingProgram) {
        self.currentTrainingProgram = trainingProgram
        self.name = trainingProgram.name
    }
    
    init() {
        self.currentTrainingProgram = TrainingProgram(name: "", exercises: [])
        self.name = ""
    }
}
