import SwiftUI
import SwiftUICharts
import Charts

struct ChartView: View {
    
    var viewModel : BarChartViewModel

    var body: some View {
        VStack {
            Chart(data: calculatedData)
                .chartStyle(
                    AreaChartStyle(.quadCurve, fill:
                        LinearGradient(gradient: .init(colors: [Color.black.opacity(0.5), Color.black.opacity(0.01)]), startPoint: .top, endPoint: .bottom)
                    )
                )
        }
    }
    
    var calculatedData : [Double] {
        
        let chartModels = viewModel.getListOfChartModel(last: viewModel.exercise.log.count, for: .left)
        
        let max = chartModels.map {$0.value}.max()
        
        var calculatedValues = [Double]()
        
        if let maxValue = max {
            for chartModel in chartModels {
                let calculatedValue = Double(chartModel.value) / Double(maxValue)
                calculatedValues.append(calculatedValue)
            }
        }

        return calculatedValues
    }
    

}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        let logs = [
            Log(left: 30, right: 20, time: 1234),
            Log(left: 80, right: 20, time: 1234),
            Log(left: 45, right: 20, time: 1234),
            Log(left: 45, right: 20, time: 1234),
            Log(left: 60, right: 20, time: 123412412)]
        ChartView(viewModel: BarChartViewModel(exercice: Exercise(name: "Something", category: .legs, trainTogether: true, log: logs)))
            
    }
}


