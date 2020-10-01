import Foundation
import SwiftUI

struct Exercise: Identifiable {
    var id = UUID()
    var name: String
    var category: TrainingCategory
    var trainTogether: Bool
    var log: [Log]
}
