//
//  Home.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 06/02/25.
//

import SwiftUI

struct Home: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView(content: {
            VStack {
                Header()
                Menu()
            }
        })
        .navigationBarBackButtonHidden()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
