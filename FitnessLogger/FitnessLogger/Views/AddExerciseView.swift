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
            VStack(alignment: .center) {
                TextField("Enter exercise name", text: self.$vm.exerciseName)
                    .font(.custom(Font.oswaldHeavy, size: 30))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Toggle("Trained separately", isOn: self.$vm.trainedSeparately)
                    .font(.custom(Font.oswaldMedium, size: FontSize.heading))
                    .padding()
                
                List(self.vm.avaliableCategories, id: \.self) { item in
                    ExerciseCategoryItem(selectedItem: self.$selectedCategory, trainingCategory: item)
                }
                
                Spacer()

                CustomTextButton(action: {
                    self.vm.saveExercise(category: selectedCategory)
                    self.showAddExercise.toggle()
                }, label: "Save")
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

