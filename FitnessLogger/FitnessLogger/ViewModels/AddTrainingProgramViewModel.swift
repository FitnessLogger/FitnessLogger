import Foundation
import SwiftUI

class AddTrainingViewModel: ObservableObject {
    @Published var exercises: [Exercise] = [Exercise]()
}
