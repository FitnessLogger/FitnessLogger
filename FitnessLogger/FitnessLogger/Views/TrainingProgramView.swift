import Foundation
import SwiftUI

struct TrainingProgramView: View {
    @ObservedObject var viewmodel = TrainingProgramViewModel()
    @State var showingAddProgramSheet = false
    @State var trainedSeparately = false
    
    var body: some View {
        HStack {
            if viewmodel.trainingPrograms.isEmpty {
                Button("Add training program", action: {
                    self.showingAddProgramSheet.toggle()
                }).sheet(isPresented: $showingAddProgramSheet) {
                    AddTrainingProgramView(showingAddProgramSheet: self.$showingAddProgramSheet, trainedSeparately: self.$trainedSeparately)
                }
            } else {
                // Show list
            }
        }
    }
}
