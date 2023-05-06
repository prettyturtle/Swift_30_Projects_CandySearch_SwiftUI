//
//  Candy.swift
//  Swift_30_Projects_CandySearch
//
//  Created by yc on 2023/05/07.
//

import Foundation

struct Candy: Hashable {
    var category: Category
    var name: String
    
    enum Category: String, CaseIterable {
        case all        = "All"
        case chocolate  = "Chocolate"
        case hard       = "Hard"
        case other      = "Other"
    }
    
    static var mocks: [Candy] {
        return [
            Candy(category: .chocolate, name: "Chocolate Bar"),
            Candy(category: .chocolate, name: "Chocolate Chip"),
            Candy(category: .chocolate, name: "Dark Chocolate"),
            Candy(category: .hard, name: "Lollipop"),
            Candy(category: .hard, name: "Candy Cane"),
            Candy(category: .hard, name: "Jaw Breaker"),
            Candy(category: .other, name: "Caramel"),
            Candy(category: .other, name: "Sour Chew"),
            Candy(category: .other, name: "Gummi Bear")
        ]
    }
}
