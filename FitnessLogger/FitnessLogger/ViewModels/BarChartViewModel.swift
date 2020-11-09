import Foundation

class BarChartViewModel {
    
    let exercise : Exercise
    
    init(exercice : Exercise) {
        self.exercise = exercice
    }
    
    var showChartsSeperately : Bool {
        return exercise.trainTogether
    }
    
    
    func getListOfChartModel(last : Int = 5, for orientation : Orientation) -> [ChartModel] {
        var chartModelList = [ChartModel]()
        
        let logs = exercise.log.suffix(last)
        
        for log in logs {
            let chartModel = ChartModel(value: log.getValue(for: orientation), time: log.time)
            chartModelList.append(chartModel)
        }
        
        return chartModelList
    }
    
}
