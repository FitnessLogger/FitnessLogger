import Foundation
import SwiftUI

struct AddExerciseView: View {
    @ObservedObject var vm: AddExerciseViewModel
    @Binding private var showAddExercise: Bool
    @State private var selectedCategory = TrainingCategory.fullBody
    
    init(viewmodel: AddExerciseViewModel, show: Binding<Bool>) {
        self.vm = viewmodel
        self._showAddExercise = show
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Exercise name", text: self.$vm.exerciseName)
                
                List(self.vm.avaliableCategories, id: \.self) { item in
                    ExerciseCategoryItem(selectedItem: self.$selectedCategory, trainingCategory: item)
                }
                
                Toggle("Trained separately", isOn: self.$vm.trainedSeparately)
                
                Spacer()
                
                Button("Save", action: {
                    self.vm.saveExercise(category: selectedCategory)
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

