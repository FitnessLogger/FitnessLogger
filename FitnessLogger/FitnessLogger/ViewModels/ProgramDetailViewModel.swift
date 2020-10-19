import Foundation

class ProgramDetailViewModel: ObservableObject {
    @Published var trainingProgram: TrainingProgram
    @Published var exercise: Exercise?
    @Published var showSheet: Bool = false
    @Published var showProgramSheet: Bool = false
    
    init(trainingProgram: TrainingProgram) {
        self.trainingProgram = trainingProgram
    }
}
