import Foundation

struct Log: Identifiable {
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
}

enum Orientation {
    case left
    case right
}
