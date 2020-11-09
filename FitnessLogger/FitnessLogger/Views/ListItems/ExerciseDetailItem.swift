import Foundation
import SwiftUI

struct ExerciseDetailItem: View {
    @ObservedObject var exercise: Exercise
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                CustomTextLabel(text: exercise.name, fontType: .heading)
                CustomTextLabel(text: exercise.log.last != nil ? exercise.log.last!.getTime() : "")
            }
            
            Spacer()
            
            CustomTextLabel(text: exercise.log.last != nil ? exercise.log.last!.getResistance(for: self.exercise.trainTogether) : "")
        }
    }
}
