import Foundation
import SwiftUI

struct UpdateExerciseLogView: View {
    @ObservedObject private var vm: UpdateExerciseLogViewModel
    @Binding var showSheet: Bool
    
    init(with viewmodel: UpdateExerciseLogViewModel, show: Binding<Bool>) {
        self.vm = viewmodel
        self._showSheet = show
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Left")
                    HStack {
                        TextField("Weight", value: self.$vm.left, formatter: NumberFormatter())
                        
                        VStack {
                            Button("+", action: {
                                let value = self.vm.left + 1
                                self.vm.updateValue(left: true, with: value)
                            }).padding()
                            
                            Button("-", action: {
                                let value = self.vm.left - 1
                                self.vm.updateValue(left: true, with: value)
                            }).padding()
                        }
                    }.padding()
                    
                    
                    if vm.exercise.trainTogether {
                        Text("Right")
                        HStack {
                            TextField("Weight", value: $vm.right, formatter: NumberFormatter())
                            
                            VStack {
                                Button("+", action: {
                                    let value = self.vm.right + 1
                                    self.vm.updateValue(left: false, with: value)
                                }).padding()
                                
                                Button("-", action: {
                                    let value = self.vm.right - 1
                                    self.vm.updateValue(left: false, with: value)
                                }).padding()
                            }
                        }.padding()
                    }
                }
                
                Spacer()
                
                if !self.vm.exercise.log.isEmpty {
                    Button("Same as last time", action: {
                        self.vm.updateLog(withSameValues: true)
                        self.showSheet.toggle()
                    }).padding()
                }
                
                
                Button("Save", action: {
                    self.vm.updateLog(withSameValues: false)
                    self.showSheet.toggle()
                })
            }
            .padding()
            .navigationBarTitle(Text("Update log"), displayMode: .inline)
        }
    }
}
