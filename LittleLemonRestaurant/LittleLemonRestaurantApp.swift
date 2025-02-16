//
//  LittleLemonRestaurantApp.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 28/01/25.
//

import SwiftUI

@main
struct LittleLemonRestaurantApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
