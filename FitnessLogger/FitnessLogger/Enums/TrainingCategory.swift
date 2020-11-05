import Foundation

enum TrainingCategory: String, Codable, CaseIterable, Identifiable {
    case fullBody = "Full Body"
    case upperBody = "Upper Body"
    case lowerBody = "Lower Body"

    var id: TrainingCategory { self }
    
    // Will be used to localize the enum strings
    func toString() -> String {
        switch self {
        case .upperBody:
            return "Upper Body"
        case .lowerBody:
            return "Lower Body"
        case .fullBody:
            return "Full Body"
    }
}
}
