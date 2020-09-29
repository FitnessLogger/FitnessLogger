import Foundation
import SwiftUI

class AddProgramViewModel: ObservableObject {
    @Published var exercises: [Exercise] = [Exercise]()
}
