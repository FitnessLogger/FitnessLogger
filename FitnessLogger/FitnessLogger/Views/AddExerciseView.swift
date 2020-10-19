import Foundation
import SwiftUI

struct AddExerciseView: View {
    @ObservedObject private var vm: AddExerciseViewModel
    @Binding private var showAddExercise: Bool
    
    init(viewmodel: AddExerciseViewModel, show: Binding<Bool>) {
        self.vm = viewmodel
        self._showAddExercise = show
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Exercise name", text: self.$vm.exerciseName)
                
                List(self.vm.strings, id: \.self) { string in
                    Text(string)
                }
                
                Toggle("Trained separately", isOn: self.$vm.trainedSeparately)
                
                Spacer()
                
                Button("Save", action: {
                    self.vm.saveExercise()
                    self.showAddExercise.toggle()
                })
                
            }.padding()
            .navigationBarTitle(Text("Add Exercise"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showAddExercise.toggle()
            }) {
                Text("Done").bold()
            })
        }
    }
}

