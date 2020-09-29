import Foundation
import SwiftUI

struct AddExerciseView: View {
    @Binding var showingAddExercise: Bool
    @Binding var trainedSeparately: Bool
    @State var exerciseName: String = ""
    let strings = ["this", "is", "a", "test"]
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Exercise name", text: $exerciseName)
                
                List(strings, id: \.self) { string in
                    Text(string)
                }
                
                
                Toggle("Trained separately", isOn: $trainedSeparately)
                
                Spacer()
                
                Button("Save", action: {
                    print("Exercise saved")
                })
                
            }.padding()
            .navigationBarTitle(Text("Add Exercise"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showingAddExercise = false
                }) {
                    Text("Done").bold()
                })
        }
    }
}

