import Foundation

struct ChartModel : Identifiable {
    var id = UUID()
    let value : Int
    let time : String
    
    init(value : Int, time: Int64) {
        self.value = value
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        self.time = formatter.string(from: Date.init(milliseconds: time))
    }
}
