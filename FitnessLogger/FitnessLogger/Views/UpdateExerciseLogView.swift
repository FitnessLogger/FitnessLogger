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
                VStack(alignment: .center) {
                    
                    Spacer()
                    
                    if vm.exercise.trainTogether {
                        CustomTextLabel(text: "Left", fontType: .heading)
                    }
                    
                    TextField("Weight", value: self.$vm.left, formatter: NumberFormatter())
                        .font(.custom(Font.oswaldHeavy, size: 60))
                        .multilineTextAlignment(.center)
                    
                    HStack(alignment: .center, spacing: 64, content: {
                        CustomTextButton(action: {
                            let value = self.vm.left - 1
                            self.vm.updateValue(left: true, with: value)
                        }, label: "-")

                        CustomTextButton(action: {
                            let value = self.vm.left + 1
                            self.vm.updateValue(left: true, with: value)
                        }, label: "+")
                    }).padding([.leading, .trailing, .bottom], 16)
                    
                    if vm.exercise.trainTogether {
                        
                        Spacer()
                        
                        CustomTextLabel(text: "Right", fontType: .heading)
                        
                        TextField("Weight", value: $vm.right, formatter: NumberFormatter())
                            .font(.custom(Font.oswaldHeavy, size: 60))
                            .multilineTextAlignment(.center)
                        
                        HStack(alignment: .center, spacing: 64, content: {
                            CustomTextButton(action: {
                                let value = self.vm.right - 1
                                self.vm.updateValue(left: false, with: value)
                            }, label: "-")

                            CustomTextButton(action: {
                                let value = self.vm.right + 1
                                self.vm.updateValue(left: false, with: value)
                            }, label: "+")
                        }).padding([.leading, .trailing, .bottom], 16)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                if !self.vm.exercise.log.isEmpty {
                    CustomTextButton(action: {
                        self.vm.updateLog(withSameValues: true)
                        self.showSheet.toggle()
                    }, label: "Same as last time", isClear: true)
                    .padding([.leading, .trailing], 8)
                }
                
                
                CustomTextButton(action: {
                    self.vm.updateLog(withSameValues: false)
                    self.showSheet.toggle()
                }, label: "Save")
                .padding()
            }
            .padding()
            .navigationBarTitle(Text("Update Weight"), displayMode: .inline)
        }
    }
}
