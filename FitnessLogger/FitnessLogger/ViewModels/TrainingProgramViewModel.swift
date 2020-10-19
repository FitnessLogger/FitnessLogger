import Foundation
import SwiftUI

class TrainingProgramViewModel: ObservableObject {
    @Published var trainingPrograms: [TrainingProgram]
    
    init() {
        self.trainingPrograms = [TrainingProgram.init(name: "Test", exercises: [Exercise(name: "Hej", category: .arms, trainTogether: true, log: [Log.init(left: 20, right: 23, time: 1111)])])]
    }
}
