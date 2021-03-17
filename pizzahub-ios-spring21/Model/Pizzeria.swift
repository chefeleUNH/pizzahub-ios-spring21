//
//  Pizzeria.swift
//  pizzahub-ios-spring21
//
//  Created by Charles Hefele on 3/16/21.
//

import Foundation

class Pizzeria: FirebaseCodable {
    var id: String
    var name: String
    var city: String
    var state: String
    var logo: String
    
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
