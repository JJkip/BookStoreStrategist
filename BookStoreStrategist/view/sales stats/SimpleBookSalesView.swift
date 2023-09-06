//
//  SimpleBookSalesView.swift
//  BookStoreStrategist
//
//  Created by Joseph Langat on 05/09/2023.
//

import SwiftUI

struct SimpleBookSalesView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    var body: some View {
        VStack {
            WeeklySalesChartView(salesViewModel: salesViewModel, salesData: WeeklySalesChartView)
        }
    }
}

struct SimpleBookSalesView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleBookSalesView(salesViewModel: .preview)
    }
}
