import Foundation
import SwiftUI

// Inspiration fra: https://medium.com/better-programming/how-to-draw-beautifully-animated-graphs-in-swiftui-part-1-8688c38a2db0

struct BarChartView: View {

    var viewModel : BarChartViewModel
    let maxValue : Int
    
    init(viewModel : BarChartViewModel) {
        
        self.viewModel = viewModel
        
        let maxLeft = viewModel.getListOfChartModel(for: .left).map {$0.value}.max()
        
        var max = 0
        
        if let actualMaxLeft = maxLeft {
            if viewModel.showChartsSeperately {
                let maxRight = viewModel.getListOfChartModel(for: .right).map {$0.value}.max()
                
                if let actualMaxRight = maxRight {
                    max = actualMaxLeft >= actualMaxRight ? actualMaxLeft : actualMaxRight
                }
            }
            else {
                max = actualMaxLeft
            }
        }
        
        self.maxValue = Int(Double(max) * 1.3)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            if viewModel.showChartsSeperately {
                CustomTextLabel(text: "Left", fontType: .heading)
            }
            
            HStack (alignment: .bottom, spacing: 30, content: {
                
                let chartModels = viewModel.getListOfChartModel(for: .left)
                
                ForEach(chartModels) { log in
                    BarChartItem(value: log.value, maxValue: maxValue, width: 30, valueName: log.time, fullHeight: !viewModel.showChartsSeperately)
                }
            })
            
            Spacer()
            
            if viewModel.showChartsSeperately {
                CustomTextLabel(text: "Right", fontType: .heading)
                
                HStack (alignment: .bottom, spacing: 30, content: {
                    let chartModels = viewModel.getListOfChartModel(for: .right)
                    
                    ForEach(chartModels) { log in
                        BarChartItem(value: log.value, maxValue: maxValue, width: 30, valueName: log.time, fullHeight: !viewModel.showChartsSeperately)
                    }
                })
                Spacer()
            }
            
        }.navigationBarTitle(self.viewModel.exercise.name)
    }
    
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        let logs = [
            Log(left: 30, right: 20, time: 1234),
            Log(left: 80, right: 20, time: 1234),
            Log(left: 45, right: 20, time: 1234),
            Log(left: 45, right: 20, time: 1234),
            Log(left: 60, right: 20, time: 123412412)]
        BarChartView(viewModel: BarChartViewModel(exercice: Exercise(name: "Something", category: .lowerBody, trainTogether: false, log: logs)))
    }
}
