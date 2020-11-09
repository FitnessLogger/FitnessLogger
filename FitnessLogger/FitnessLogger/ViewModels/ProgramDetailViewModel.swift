import Foundation

class ProgramDetailViewModel: ObservableObject {
    @Published var trainingProgram: TrainingProgram
    @Published var exercise: Exercise?
    @Published var showSheet: Bool = false
    @Published var showProgramSheet: Bool = false
    let isHistory : Bool
    
    init(trainingProgram: TrainingProgram, isHistory : Bool = false) {
        self.trainingProgram = trainingProgram
        self.isHistory = isHistory
    }
}
