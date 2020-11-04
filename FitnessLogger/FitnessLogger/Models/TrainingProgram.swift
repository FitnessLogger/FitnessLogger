import Foundation
import SwiftUI

class TrainingProgram: ObservableObject, Identifiable, Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case exercises
    }
    
    var id: String
    var name: String
    @Published var exercises: [Exercise]
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        exercises = try values.decode([Exercise].self, forKey: .exercises)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(exercises, forKey: .exercises)
    }
    
    init(name: String, exercises: [Exercise]) {
        self.id = UUID().description
        self.name = name
        self.exercises = exercises
    }
    
    func toDict() -> [String : Any] {
        var dict: [String : Any] = [:]
        
        dict["id"] = self.id
        dict["name"] = self.name
        
//        var localExercices: [[String : Any]] = []
//        for exercise in exercises {
//            localExercices.append(exercise.toDict())
//        }
//        
//        dict["exercises"] = localExercices
        
        return dict
    }
}
