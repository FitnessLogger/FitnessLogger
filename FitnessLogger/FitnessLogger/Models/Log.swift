import Foundation

struct Log: Identifiable {
    var id = UUID()
    var trainedSeparatly: Bool
    var left: Int
    var right: Int
    var time: Int64
    
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM-yyyy"
        
        return formatter.string(from: Date.init(milliseconds: time))
    }
    
    func getResistance() -> String {
        if trainedSeparatly {
            return "L: \(left) | R: \(right)"
        }
        
        return "\(left)"
    }
}
