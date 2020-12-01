import Foundation

class ProgramDetailViewModel: ObservableObject {
    @Published var trainingProgram: TrainingProgram
    @Published var exercise: Exercise?
    @Published var showSheet: Bool = false
    @Published var showProgramSheet: Bool = false
    var programs: [TrainingProgram]
    
    let isHistory : Bool
    
    init(trainingProgram: TrainingProgram, programs: [TrainingProgram], isHistory : Bool = false) {
        self.programs = programs
        self.trainingProgram = trainingProgram
        self.isHistory = isHistory
    }
}
