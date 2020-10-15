import Foundation
import SwiftUI

struct UpdateExerciseLogView: View {
    @Binding var showSheet: Bool
    
    @State var left: Int
    @State var right: Int
    @State var exercise: Exercise
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Left")
                    HStack {
                        TextField("Weight", value: self.$left, formatter: NumberFormatter())
                        
                        VStack {
                            Button("+", action: {
                                self.left += 1
                            }).padding()
                            
                            Button("-", action: {
                                self.left -= 1
                            }).padding()
                        }
                    }.padding()
                    
                    
                    if exercise.trainTogether {
                        Text("Right")
                        HStack {
                            TextField("Weight", value: self.$right, formatter: NumberFormatter())
                            
                            VStack {
                                Button("+", action: {
                                    self.right += 1
                                }).padding()
                                
                                Button("-", action: {
                                    self.right -= 1
                                }).padding()
                            }
                        }.padding()
                    }
                }
                
                Spacer()
                
                if !self.exercise.log.isEmpty {
                    Button("Same as last time", action: {
                        let item = exercise.log.last
                        
                        if var item = item {
                            item.time = Date().millisecondsSince1970
                            self.exercise.log.append(item)
                        }
                        
                        self.showSheet.toggle()
                    }).padding()
                }
                
                
                Button("Save", action: {
                    let item = Log(left: self.left, right: self.right, time: Date().millisecondsSince1970)
                    self.exercise.log.append(item)
                    self.showSheet.toggle()
                })
            }
            .padding()
            .navigationBarTitle(Text("Update log"), displayMode: .inline)
        }
    }
}
