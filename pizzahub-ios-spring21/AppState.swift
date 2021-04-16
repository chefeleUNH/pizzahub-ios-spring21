//
//  AppState.swift
//  pizzahub-ios-spring21
//
//  Created by Charles Hefele on 4/13/21.
//

import Combine

class AppState: ObservableObject {
    @Published var selectedTab: Tab = .pizzerias
}
