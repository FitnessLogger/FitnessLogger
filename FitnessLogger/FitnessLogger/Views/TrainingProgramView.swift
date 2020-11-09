import Foundation
import Firebase
import SwiftUI

struct TrainingProgramView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject var tp: Program
    @ObservedObject var global = ControllerRegister.global
    @State var showingAddProgramSheet = false
    let isHistory : Bool
    
    let programService = ControllerRegister.programService
    
    init(tp: Program, isHistory : Bool = false) {
        self.tp = tp
        self.isHistory = isHistory
    }
    
    let emptyHistoryString = "You have no recorded training data."
    let emptyProgram = "You have no programs created yet. Click the button blow, and start your journey."
    
    var body: some View {
        VStack {
            if tp.items.isEmpty {
                
                Spacer()
                
                CustomTextLabel(text: isHistory ? emptyHistoryString : emptyProgram, alignment: .center)
                    .padding()
                
                Spacer()
                
                if !isHistory {
                    CustomTextButton(action: {
                        self.showingAddProgramSheet.toggle()
                    }, label: "Add training program")
                    .padding()
                    .sheet(isPresented: $showingAddProgramSheet) {
                        let viewmodel = AddTrainingProgramViewModel(program: self.tp)
                        AddTrainingProgramView(viewmodel: viewmodel, show: self.$showingAddProgramSheet)
                    }
                }
            } else {
                List {
                    ForEach(self.tp.items) { item in
                        let vm = ProgramDetailViewModel(trainingProgram: item, isHistory: isHistory)
                        NavigationLink(destination: ProgramDetailView(viewmodel: vm)) {
                            TrainingProgramItem(trainingProgram: item)
                        }
                    }.onDelete(perform: delete)
                }
            }
        }.navigationBarItems(trailing:
            HStack {
                if !isHistory {
                    Button(action: {
                        self.showingAddProgramSheet.toggle()
                    }) {
                        Image(systemName: "plus").imageScale(.large)
                    }.sheet(isPresented: $showingAddProgramSheet) {
                        let viewmodel = AddTrainingProgramViewModel(program: self.tp)
                        AddTrainingProgramView(viewmodel: viewmodel, show: self.$showingAddProgramSheet)
                    }
                }
            }
        )
    }
    
    private func delete(with indexSet: IndexSet) {
        
        if let indexToDelete = indexSet.first {
            
            // delete in firebase
            self.programService.deleteProgram(for: self.global.userId, with: self.tp.items[indexToDelete].id) { success in
                // for future development
            }
            
            self.tp.items.remove(at: indexToDelete)
        }
    }
}
