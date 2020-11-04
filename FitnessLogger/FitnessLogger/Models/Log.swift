import Foundation

struct Log: Identifiable, Codable {
    var id = UUID()
    var left: Int
    var right: Int
    var time: Int64
    
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM-yyyy"
        
        return formatter.string(from: Date.init(milliseconds: time))
    }
    
    func getResistance(for both: Bool) -> String {
        if both {
            return "L: \(left) | R: \(right)"
        }
        
        return "\(left)"
    }
    
    func getValue(for orientation: Orientation) -> Int {
        if orientation == .left {
            return left
        }
        
        return right
    }
    
    func toDict() -> [String : Any] {
        var dict : [String : Any] = [:]
        
        dict["id"] = id
        dict["left"] = left
        dict["right"] = right
        dict["time"] = time
        
        return dict
    }
}

enum Orientation {
    case left
    case right
}
