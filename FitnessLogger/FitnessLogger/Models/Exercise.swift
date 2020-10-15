import Foundation
import SwiftUI

class Exercise: Identifiable, ObservableObject {
    var id = UUID()
    var name: String
    var category: TrainingCategory
    var trainTogether: Bool
    @Published var log: [Log]
    
    init(name: String, category: TrainingCategory, trainTogether: Bool, log: [Log]) {
        self.name = name
        self.category = category
        self.trainTogether = trainTogether
        self.log = log
    }
}
