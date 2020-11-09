import Foundation
import SwiftUI

class TrainingProgram: ObservableObject, Identifiable, Codable, Equatable {

    var id: String
    var name: String
    @Published var exercises: [Exercise]
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        do {
            exercises = try values.decode([Exercise].self, forKey: .exercises)
            exercises = exercises.sorted(by: { $0.id < $1.id })
        }
        catch {
            exercises = [Exercise]()
        }
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(exercises, forKey: .exercises)
    }
    
    init(name: String, exercises: [Exercise]) {
        self.id = "\(Date().millisecondsSince1970)"
        self.name = name
        self.exercises = exercises.sorted(by: { $0.id < $1.id })
    }
    
    static func == (lhs: TrainingProgram, rhs: TrainingProgram) -> Bool {
        return lhs.id == rhs.id
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case exercises
    }
}
