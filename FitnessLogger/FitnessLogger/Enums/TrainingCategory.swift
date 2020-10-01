import Foundation

enum TrainingCategory {
    case chest
    case arms
    case legs
    
    var rawValue: String {
        switch self {
        case .chest: return "Chest"
        case .arms: return "Arms"
        case .legs: return "Legs"
        }
    }
}
