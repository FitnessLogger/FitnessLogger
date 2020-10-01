import Foundation
import SwiftUI

struct ExerciseDetailItem: View {
    var exercise: Exercise
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(exercise.name)
                Text(exercise.log.last != nil ? exercise.log.last!.getTime() : "")
            }
            
            Spacer()
            
            Text(exercise.log.last != nil ? exercise.log.last!.getResistance() : "")
        }
    }
}
