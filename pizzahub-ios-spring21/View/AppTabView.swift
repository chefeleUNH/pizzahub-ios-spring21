//
//  AppTabView.swift
//  pizzahub-ios-spring21
//
//  Created by Charles Hefele on 4/13/21.
//

import SwiftUI

struct AppTabView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        TabView(selection: $appState.selectedTab) {
            PizzeriaListView()
                .tabItem {
                    Image(systemName: "list.dash").font(.title)
                    Text("Pizzerias")
                }
                .tag(Tab.pizzerias)
        }
    }
}
