import Foundation
import SwiftUI
import Firebase
import CodableFirebase

class Program: ObservableObject {
    @Published var items = [TrainingProgram]()
    @ObservedObject var global = ControllerRegister.global
    
    func append(trainingProgram: TrainingProgram) {
        self.items.append(trainingProgram)
    }
    
    func fetchDataFromFirebase() {
        let ref = Database.database().reference()
        ref.child(Constants.trainingPrograms).child(self.global.userId)
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard let values = snapshot.value as? [String : Any] else { return }
            let user = values["trainingsPrograms"]
            
            guard let userDict = user as? [String : Any] else { return }
            
            for (key, values) in userDict {
                print(values)
            }
            
//            print(test!)
        
//            do {
//                let model = try FirebaseDecoder().decode([TrainingProgram].self, from: Array(arrayLiteral: user!))
//                print(model)
//            } catch {
//                print(error)
//            }
            
        }) { error in
            print(error)
        }
    }
}
