import Foundation
import SwiftUI

class UpdateExerciseLogViewModel: ObservableObject {
    @Published var exercise: Exercise
    @Published var left: Int
    @Published var right: Int
    
    init(with exercise: Exercise) {
        self.exercise = exercise
        
        if let log = exercise.log.last {
            self.left = log.left
            self.right = log.right
        } else {
            self.left = 0
            self.right = 0
        }
    }
    
    func updateValue(left: Bool, with value: Int) {
        if value < 0 {
            return
        }
        
        if left {
            self.left = value
        } else {
            self.right = value
        }
    }
}
