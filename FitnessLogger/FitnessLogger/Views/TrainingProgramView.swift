import Foundation
import SwiftUI

struct TrainingProgramView: View {
    @ObservedObject var viewmodel = MainViewViewModel()
    
    var body: some View {
        HStack {
            if viewmodel.trainingPrograms.isEmpty {
                Button.init("Add Training program", action: {
                    print("Button pressed")
                })
            } else {
                // Show list
            }
        }
    }
}
