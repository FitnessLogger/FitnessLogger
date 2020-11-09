import Foundation
import Firebase

struct ProgramService {
    
    private var firebase : Firebase
    
    private let programUrl = "trainingPrograms/"
    private let databaseRef = Database.database().reference().child(Constants.trainingPrograms)
    
    init(firebase : Firebase) {
        self.firebase = firebase
    }
    
    func getProgram(with programId: String, for userId: String, completion: @escaping (TrainingProgram?) -> Void) {
        firebase.getData(returnType: TrainingProgram.self, url: "\(programUrl)\(userId)/\(programId)") { trainingProgram in
            completion(trainingProgram)
        }
    }
    
    func getPrograms(for userId: String, completion: @escaping ([TrainingProgram]?) -> Void) {
        firebase.getListOfData(returnType: TrainingProgram.self, url: "\(programUrl)\(userId)") { programs in
            completion(programs?.sorted(by: { $0.id < $1.id }))
        }
    }
    
    func deleteProgram(for userId: String, with programId: String, completion: @escaping (Bool) -> Void) {
        self.databaseRef.child(userId).child(programId).setValue(nil) { (error, ref) in
            completion(error == nil)
        }
    }
    
    
}
