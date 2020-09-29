import Foundation

class TrainingProgram: Identifiable {
    var id = UUID()
    var name: String
    var exercises: [Exercise]
    
    init(name: String, exercises: [Exercise]) {
        self.name = name
        self.exercises = exercises
    }
}
