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
    
    
}
