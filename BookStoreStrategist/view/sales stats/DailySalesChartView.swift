//
//  DailySalesChartView.swift
//  BookStoreStrategist
//
//  Created by Joseph Langat on 02/09/2023.
//

import SwiftUI
import Charts

struct DailySalesChartView: View {
    let salesData: [Sale]
    
    var body: some View {
        Chart(salesData) { sale in
            BarMark(x: .value("Day", sale.saleDate, unit: .day), y: .value("Sales", sale.quantity))
        }
    }
}

struct DailySalesChartView_Previews: PreviewProvider {
    static var previews: some View {
        DailySalesChartView(salesData: Sale.threeMonthsExamples())
            .aspectRatio(1,contentMode: .fit)
            .padding()
    }
}
