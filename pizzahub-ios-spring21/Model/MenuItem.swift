//
//  MenuItem.swift
//  pizzahub-ios-spring21
//
//  Created by Charles Hefele on 3/25/21.
//

import FirebaseFirestore

class MenuItem: FirebaseCodable {
    
    var id: String
    @Published var name: String
    @Published var price: String
    @Published var photo: String
    
    required init?(id: String, data: [String : Any]) {
        guard let name = data["name"] as? String,
              let price = data["price"] as? String,
              let photo = data["photo"] as? String
        else {
            return nil
        }
        
        self.id = id
        self.name = name
        self.price = price
        self.photo = photo
    }
    
}
