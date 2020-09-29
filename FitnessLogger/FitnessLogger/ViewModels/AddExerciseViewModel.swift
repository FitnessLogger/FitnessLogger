import Foundation
import SwiftUI

class AddExerciseViewModel: ObservableObject {
    @Published var exercises: [Exercise] = [Exercise]()
}
