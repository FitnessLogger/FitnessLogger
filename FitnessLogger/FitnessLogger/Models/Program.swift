import Foundation

class Program: ObservableObject {
    @Published var items = [TrainingProgram]()
    
    func append(trainingProgram: TrainingProgram) {
        self.items.append(trainingProgram)
    }
}
