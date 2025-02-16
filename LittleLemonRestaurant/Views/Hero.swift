//
//  Hero.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 07/02/25.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Little Lemon")
                        .foregroundColor(Color.primaryColor2)
                        .font(.displayFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Chicago")
                        .foregroundColor(.highlightColor1)
                        .font(.subTitleFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                    Text("""
                     We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                     """)
                    .foregroundColor(.highlightColor1)
                    .font(.leadText())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                Image("Hero-image")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(maxWidth: 120, maxHeight: 150)
                    .cornerRadius(20)
            }
        }
    }
}

#Preview {
    Hero()
        .padding()
        .background(Color.primaryColor1)
        .frame(maxWidth: .infinity, maxHeight: 240)
}
