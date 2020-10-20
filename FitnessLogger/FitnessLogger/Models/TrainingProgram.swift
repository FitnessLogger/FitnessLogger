import Foundation
import SwiftUI

class TrainingProgram: ObservableObject, Identifiable {
    var id = UUID()
    var name: String
    @Published var exercises: [Exercise]
    
    init(name: String, exercises: [Exercise]) {
        self.name = name
        self.exercises = exercises
    }
}
