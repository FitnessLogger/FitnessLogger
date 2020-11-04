import Foundation
import SwiftUI
import Firebase
import CodableFirebase

class Program: ObservableObject {
    @Published var items = [TrainingProgram]()
    @ObservedObject var global = ControllerRegister.global
    private var programService = ControllerRegister.programService
    
    func append(trainingProgram: TrainingProgram) {
        self.items.append(trainingProgram)
    }
    
    func fetchDataFromFirebase() {
        programService.getPrograms(for: global.userId) { trainingPrograms in
            if let programs = trainingPrograms {
                for program in programs {
                    if !self.items.contains(where: { $0.id == program.id })  {
                        DispatchQueue.main.async {
                            self.items.append(program)
                        }
                    }
                }
            }
            self.global.updateLoadingState(isLoading: false)
        }
    }
}
