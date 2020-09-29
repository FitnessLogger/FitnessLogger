import Foundation
import SwiftUI

struct AddTrainingProgramView: View {
    @Binding var showingAddProgramSheet: Bool
    @Binding var trainedSeparately: Bool
    @State var showingAddExercise = false
    @State private var name: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter program name", text: $name)
                
                Spacer()
                
                Button("Add exercise", action: {
                    self.showingAddExercise.toggle()
                }).sheet(isPresented: $showingAddExercise) {
                    AddExerciseView(showingAddExercise: self.$showingAddExercise, trainedSeparately: $trainedSeparately)
                }
                
                Spacer()
            }.padding()
            .navigationBarTitle(Text("Add program"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showingAddProgramSheet = false
                }) {
                    Text("Save").bold()
                })
        }
    }
}
