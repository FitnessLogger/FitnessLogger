import Foundation
import SwiftUI

class AddExerciseViewModel: ObservableObject {
    @Published var trainedSeparately: Bool
    @Published var exerciseName: String
    @Published var trainingProgram: TrainingProgram
    
    let strings = ["this", "is", "a", "test"]
    
    init(trainingProgram: TrainingProgram) {
        self.trainingProgram = trainingProgram
        self.trainedSeparately = false
        self.exerciseName = ""
    }
    
    func saveExercise() {
        let exercise: Exercise = Exercise(name: self.exerciseName, category: .arms, trainTogether: self.trainedSeparately, log: [])
        self.trainingProgram.exercises.append(exercise)
    }
}
