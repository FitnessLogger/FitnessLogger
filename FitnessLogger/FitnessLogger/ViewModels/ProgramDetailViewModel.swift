import Foundation

class ProgramDetailViewModel: ObservableObject {
    @Published var trainingProgram: TrainingProgram
    @Published var exercise: Exercise?
    
    init(trainingProgram: TrainingProgram) {
        self.trainingProgram = trainingProgram
    }
}
