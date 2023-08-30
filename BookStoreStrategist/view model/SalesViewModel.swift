//
//  SalesViewModel.swift
//  BookStoreStrategist
//
//  Created by Joseph Langat on 28/08/2023.
//

import Foundation

class SalesViewModel: ObservableObject {
    
    @Published var salesData = [Sale]()
    
    var totalSales: Int {
        salesData.reduce(0) { $0 + $1.quantity}
    }
    
    var lastTotalSales: Int = 0
    
//    var salesByDay: [(day: Date, sales: Int)] {
//        let salesByDay = salesGroupedByDay(sales: salesData)
//        return totalSalesPerDate(salesByDate: salesByDay)
//    }
    
    func salesGroupedByWeek(sales: [Sale]) -> [Date: [Sale]] {
        var salesByWeek: [Date: [Sale]] = [:]
        let calender = Calendar.current
        for sale in sales {
            guard let startOfWeek = calender.date(from: calender.dateComponents([.yearForWeekOfYear, .yearForWeekOfYear,.weekOfYear], from: sale.saleDate)) else { continue }
            if salesByWeek[startOfWeek] != nil {
                salesByWeek[startOfWeek]!.append(sale)
            } else {
                salesByWeek[startOfWeek] = [sale]
            }
        }
        return salesByWeek
    }
    
}
