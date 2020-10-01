import Foundation
import SwiftUI

class TrainingProgramViewModel: ObservableObject {
    @Published var trainingPrograms: [TrainingProgram] = [TrainingProgram.init(name: "Test", exercises: [Exercise(name: "Hej", category: .arms, trainTogether: false, log: [Log(id: UUID(), trainedSeparatly: true, left: 20, right: 23, time: 1111)])])]
}
