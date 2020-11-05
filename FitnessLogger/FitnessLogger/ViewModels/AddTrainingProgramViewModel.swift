import Foundation
import SwiftUI
import Firebase
import CodableFirebase

class AddTrainingProgramViewModel: ObservableObject {
    @Published var trainingPrograms: Program?
    @Published var currentTrainingProgram: TrainingProgram
    @Published var name: String
    @Published var showAddExercise: Bool = false
    @ObservedObject var global = ControllerRegister.global
    
    init(trainingProgram: TrainingProgram) {
        self.currentTrainingProgram = trainingProgram
        self.name = trainingProgram.name
    }
    
    init(program: Program) {
        self.currentTrainingProgram = TrainingProgram(name: "", exercises: [])
        self.name = ""
        self.trainingPrograms = program
    }
    
    func saveTrainingProgram(completion: @escaping (Bool) -> Void) {
        currentTrainingProgram.name = self.name
        self.trainingPrograms?.append(trainingProgram: currentTrainingProgram)
        saveToFirestore(trainingProgram: currentTrainingProgram) { success in
            completion(success)
        }
    }
    
    private func saveToFirestore(trainingProgram: TrainingProgram, completion: @escaping (Bool) -> Void) {
        let ref = Database.database().reference().child(Constants.trainingPrograms).child(self.global.userId)
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
