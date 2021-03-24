//
//  ContentView.swift
//  pizzahub-ios-spring21
//
//  Created by Charles Hefele on 3/16/21.
//

import SwiftUI
import FirebaseFirestore

let pizzeriasCollectionRef = Firestore.firestore().collection("pizzerias")

struct PizzeriaListView: View {
    @ObservedObject private var pizzerias: FirebaseCollection<Pizzeria>
    private var pizzeriasQuery: Query
    
    init() {
        self.pizzeriasQuery = pizzeriasCollectionRef.order(by: "city")
        self.pizzerias = FirebaseCollection<Pizzeria>(query: pizzeriasQuery)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(pizzerias.items) { pizzeria in
                    NavigationLink(destination: PizzeriaDetailView(pizzeria: pizzeria)) {
                        PizzeriaRow(pizzeria: pizzeria)
                    }
                }
            }
            .navigationBarTitle("Pizzerias")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PizzeriaListView()
    }
}
