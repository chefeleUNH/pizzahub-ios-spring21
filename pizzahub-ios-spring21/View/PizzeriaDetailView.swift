//
//  PizzeriaDetailView.swift
//  pizzahub-ios-spring21
//
//  Created by Charles Hefele on 3/23/21.
//

import SwiftUI

struct PizzeriaDetailView: View {
    @ObservedObject private var pizzeria: Pizzeria
    
    init(pizzeria: Pizzeria) {
        self.pizzeria = pizzeria
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(pizzeria.city)
                Text(pizzeria.state)
                Spacer()
            }
            Text("Menu")
                .font(.largeTitle)
        }
        .padding()
        .navigationBarTitle(pizzeria.name)
    }
    
}
