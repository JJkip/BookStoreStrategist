//
//  WeeklySalesChartView.swift
//  BookStoreStrategist
//
//  Created by Joseph Langat on 02/09/2023.
//

import SwiftUI
import Charts


struct WeeklySalesChartView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    
    let salesData: [Sale]
    
    var body: some View {
        Chart(salesViewModel.salesByWeek, id: \.day) { saleDate in
            BarMark(x: .value("Week", saleDate.day, unit: .weekOfYear), y: .value("Sales", saleDate.sales))
                .foregroundStyle(Color.blue.gradient)
        }
    }
}

struct PlainDataWeeklyChartsView: View {
    let salesData: [Sale]
    
    var body: some View {
        Chart(salesData) { sale in
            BarMark(x: .value("Week", sale.saleDate, unit: .weekOfYear), y: .value("Sales", sale.quantity))
                .foregroundStyle(Color.blue.gradient)
        }
    }
}

struct WeeklySalesChartView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklySalesChartView(salesViewModel: SalesViewModel.preview, salesData: Sale.threeMonthsExamples())
            .aspectRatio(1,contentMode: .fit)
            .padding()
    }
}

struct PlainDataWeeklyChartsView_Previews: PreviewProvider {
    static var previews: some View {
        PlainDataWeeklyChartsView(salesData: Sale.threeMonthsExamples())
            .aspectRatio(1,contentMode: .fit)
            .padding()
    }
}
