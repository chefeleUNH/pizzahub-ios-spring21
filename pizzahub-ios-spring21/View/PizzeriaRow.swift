//
//  PizzeriaRow.swift
//  pizzahub-ios-spring21
//
//  Created by Charles Hefele on 3/18/21.
//

import SwiftUI

struct PizzeriaRow: View {
    @ObservedObject var pizzeria: Pizzeria
    
    var body: some View {
        HStack {
            Text(pizzeria.name)
        }
    }
}
