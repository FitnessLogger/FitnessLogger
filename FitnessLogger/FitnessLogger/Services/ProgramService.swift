import Foundation

struct ProgramService {
    
    private var firebase : Firebase
    
    private let programUrl = "trainingPrograms/"
    
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
            completion(programs)
        }
    }
    
    
}
