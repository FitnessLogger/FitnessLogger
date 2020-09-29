import Foundation

class Exercise {
    var name: String
    var category: TrainingCategory
    var trainTogether: Bool
    
    init(name: String, category: TrainingCategory, trainTogether: Bool) {
        self.name = name
        self.category = category
        self.trainTogether = trainTogether
    }
}