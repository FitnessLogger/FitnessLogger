import SwiftUI
import SwiftUICharts

struct ChartView: View {
    
    var data : [Double] = [8,23,54,32,12,37,7,23,43]

    var body: some View {
        VStack {
            LineView(data: [8,23,54,32,12,37,7,23,43], title: "Line chart", legend: "Full screen").frame(height: 300)
        }
    }
    

}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
            .preferredColorScheme(.light)
    }
}


