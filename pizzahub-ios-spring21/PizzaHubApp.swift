//
//  pizzahub_ios_spring21App.swift
//  pizzahub-ios-spring21
//
//  Created by Charles Hefele on 3/16/21.
//

import SwiftUI

@main
struct PizzaHubApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            PizzeriaListView()
        }
    }
}
