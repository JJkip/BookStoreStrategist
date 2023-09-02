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
    
    @Published var lastTotalSales: Int = 0
    
    var salesByWeek: [(day: Date, sales: Int)] {
        let salesByWeek = salesGroupedByWeek(sales: salesData)
        return totalSalesPerDate(salesBydate: salesByWeek)
    }
    
    init() {
        //fetch data from server
    }
//    var salesByDay: [(day: Date, sales: Int)] {
//        let salesByDay = salesGroupedByDay(sales: salesData)
//        return totalSalesPerDate(salesByDate: salesByDay)
//    }
    
    func salesGroupedByWeek(sales: [Sale]) -> [Date: [Sale]] {
        var salesByWeek: [Date: [Sale]] = [:]
        
        let calender = Calendar.current
        for sale in sales {
            guard let startOfWeek = calender.date(from: calender.dateComponents([.yearForWeekOfYear,.weekOfYear], from: sale.saleDate)) else { continue }
            if salesByWeek[startOfWeek] != nil {
                salesByWeek[startOfWeek]!.append(sale)
            } else {
                salesByWeek[startOfWeek] = [sale]
            }
        }
        return salesByWeek
    }
    
    func totalSalesPerDate(salesBydate: [Date: [Sale]]) -> [(day: Date, sales: Int)] {
        var totalSales: [(day: Date, sales: Int)] = []
        
        for (date, sales) in salesBydate {
            let totalQuantityForDate = sales.reduce(0) { $0 + $1.quantity }
            totalSales.append((day:date, sales: totalQuantityForDate))
        }
        return totalSales
    }
    
    func averageSalesPerNumber(salesByNumber: [Int: [Sale]]) -> [(number: Int, sales: Double)] {
        var averageSales: [(number: Int, sales: Double)] = []

        for (number, sales) in salesByNumber {
            let count = sales.count
            let totalQuantityForWeekday = sales.reduce(0) { $0 + $1.quantity }
            averageSales.append((number: number, sales: Double(totalQuantityForWeekday) / Double(count)))
        }

        return averageSales
    }
    
    static var preview: SalesViewModel {
        let vm = SalesViewModel()
        vm.salesData = Sale.examples
        vm.lastTotalSales = 1200
        return vm
    }
}
