import Foundation
import SwiftUI

class AddExerciseViewModel: ObservableObject {
    @Published var trainedSeparately: Bool
    @Published var exerciseName: String
    @Published var trainingProgram: TrainingProgram
    
    let avaliableCategories : [TrainingCategory] = [.fullBody, .upperBody, .lowerBody]
    
    init(trainingProgram: TrainingProgram) {
        self.trainingProgram = trainingProgram
        self.trainedSeparately = false
        self.exerciseName = ""
    }
    
    func saveExercise(category : TrainingCategory) {
        let exercise: Exercise = Exercise(name: self.exerciseName, category: category, trainTogether: self.trainedSeparately, log: [])
        self.trainingProgram.exercises.append(exercise)
    }
}
