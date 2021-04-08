//
//  Pizzeria.swift
//  pizzahub-ios-spring21
//
//  Created by Charles Hefele on 3/16/21.
//

import Foundation

class Pizzeria: FirebaseCodable, Equatable {
    static func == (lhs: Pizzeria, rhs: Pizzeria) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    var id: String
    @Published var name: String
    @Published var city: String
    @Published var state: String
    @Published var logo: String
    
    required init?(id: String, data: [String: Any]) {
        guard let name = data["name"] as? String,
              let city = data["city"] as? String,
              let state = data["state"] as? String,
              let logo = data["logo"] as? String
        else {
            return nil
        }
        
        self.id = id
        self.name = name
        self.city = city
        self.state = state
        self.logo = logo
              
    }
    
}
