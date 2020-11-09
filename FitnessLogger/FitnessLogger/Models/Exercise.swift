import Foundation
import SwiftUI

class Exercise: Identifiable, ObservableObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case category
        case trainedTogether
        case log
    }
    
    var id: String
    var name: String
    var category: TrainingCategory
    var trainTogether: Bool
    @Published var log: [Log]
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        category = try values.decode(TrainingCategory.self, forKey: .category)
        trainTogether = try values.decode(Bool.self, forKey: .trainedTogether)
        do {
            log = try values.decode([Log].self, forKey: .log)
        } catch {
            log = [Log]()
        }
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(category, forKey: .category)
        try container.encode(trainTogether, forKey: .trainedTogether)
        try container.encode(log, forKey: .log)
    }
    
    init(name: String, category: TrainingCategory, trainTogether: Bool, log: [Log]) {
        self.id = "\(Date().millisecondsSince1970)"
        self.name = name
        self.category = category
        self.trainTogether = trainTogether
        self.log = log
    }
    
    func toDict() -> [String : Any] {
        var dict : [String : Any] = [:]
        
        dict["id"] = id
        dict["name"] = name
        dict["category"] = category.rawValue
        dict["trainTogether"] = trainTogether
        
        var logs: [[String : Any]] = []
        for log in log {
            logs.append(log.toDict())
        }
        
        dict["logs"] = logs
        
        return dict
    }
}
