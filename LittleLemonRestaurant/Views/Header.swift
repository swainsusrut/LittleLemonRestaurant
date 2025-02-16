//
//  Header.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 07/02/25.
//

import SwiftUI

struct Header: View {
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack(root: {
            ZStack {
                Image("Logo")
                HStack {
                    Spacer()
                    if isLoggedIn {
                        NavigationLink(destination: UserProfile()) {
                            Image("Profile")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(maxHeight: 50)
                                .clipShape(Circle())
                                .padding(.trailing)
                        }
                    }
                }
            }
        })
        .frame(maxHeight: 50)
        
        .onAppear() {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            } else {
                isLoggedIn = false
            }
        }
    }
}

#Preview {
    Header()
}
