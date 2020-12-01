import Foundation
import SwiftUI
import FirebaseDatabase
import CodableFirebase

class UpdateExerciseLogViewModel: ObservableObject {
    @Published var exercise: Exercise
    @Published var left: Int
    @Published var right: Int
    @ObservedObject var global = ControllerRegister.global
    
    // Used for updating entire program
    // in Firebase when user updates log
    var trainingProgram: TrainingProgram
    
    init(with exercise: Exercise, for trainingProgram: TrainingProgram) {
        self.exercise = exercise
        self.trainingProgram = trainingProgram
        
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
    
    func updateLog(withSameValues: Bool) {
        guard let currentUserId = global.userId else { return }
        
        if withSameValues {
            let item = self.exercise.log.last
            
            if var item = item {
                item.time = Date().millisecondsSince1970
                self.exercise.log.append(item)
            }
        } else {
            let item = Log(left: self.left, right: self.right, time: Date().millisecondsSince1970)
            self.exercise.log.append(item)
        }
        
        // Save to firebase
        let ref = Database.database().reference().child(Constants.trainingPrograms).child(currentUserId)
        do {
            let data = try FirebaseEncoder().encode(self.trainingProgram)
            ref.child(trainingProgram.id).setValue(data)
        } catch {
            NSLog(error.localizedDescription)
        }
        
    }
}
