//
//  ShoppingCart.swift
//  pizzahub-ios-spring21
//
//  Created by Charles Hefele on 3/30/21.
//

import Combine

class ShoppingCart: ObservableObject {
    @Published var pizzeria: Pizzeria?
    @Published var item = [MenuItem]()
}
