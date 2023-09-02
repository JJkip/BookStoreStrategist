//
//  BookCategoty.swift
//  BookStoreStrategist
//
//  Created by Joseph Langat on 23/08/2023.
//

import Foundation

enum BookCategory: String, Identifiable, CaseIterable {
    case fiction
    case biography
    case children
    case computerScience
    case fantasy
    case business
  
    
    var id: Self { return self }
    
    var displayName: String {
        switch self {
            case .fiction:
                return "Fiction"
            case .biography:
                return "Biography"
            case .children:
                return "Children Books"
            case .computerScience:
                return"Computer Science"
            case .fantasy:
                return "Fantasy"
            case .business:
                return "Business"
        }
    }
}
