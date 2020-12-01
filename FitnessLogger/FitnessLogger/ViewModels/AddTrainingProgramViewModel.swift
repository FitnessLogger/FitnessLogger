import Foundation
import SwiftUI
import Firebase
import CodableFirebase

class AddTrainingProgramViewModel: ObservableObject {
    @Published var trainingPrograms: [TrainingProgram]
    @Published var currentTrainingProgram: TrainingProgram
    @Published var name: String
    @Published var showAddExercise: Bool = false
    @ObservedObject var global = ControllerRegister.global
    
    init(trainingProgram: TrainingProgram, programs: [TrainingProgram]) {
        self.trainingPrograms = programs
        self.currentTrainingProgram = trainingProgram
        self.name = trainingProgram.name
    }
    
    init(programs: [TrainingProgram]) {
        self.currentTrainingProgram = TrainingProgram(name: "", exercises: [])
        self.name = ""
        self.trainingPrograms = programs
    }
    
    func saveTrainingProgram() -> TrainingProgram {
        currentTrainingProgram.name = self.name
        saveToFirestore(trainingProgram: currentTrainingProgram) { (success) in
            // do something
        }
        
        return currentTrainingProgram
    }
    
    private func saveToFirestore(trainingProgram: TrainingProgram, completion: @escaping (Bool) -> Void) {
        guard let currentUserId = global.userId else { completion(false); return }
        let ref = Database.database().reference().child(Constants.trainingPrograms).child(currentUserId)
        let data = try! FirebaseEncoder().encode(trainingProgram)
        ref.child(trainingProgram.id).setValue(data) { (error, ref) in
            completion(error == nil)
        }
    }
}

enum UploadingState {
    case passiv
    case uploading
    case success
    case failure
}
