//
//  Menu.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 11/02/25.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        Text("Hello, Menu!")
    }
}

#Preview {
    Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
