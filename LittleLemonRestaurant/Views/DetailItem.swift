//
//  DetailItem.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 15/02/25.
//

import SwiftUI

struct DetailItem: View {
    @Environment(\.managedObjectContext) private var viewContext

    let dish: Dish

    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(minWidth: 150, minHeight: 150)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(dish.title ?? "")
                .font(.subTitleFont())
                .foregroundStyle(Color.primaryColor1)
            Spacer(minLength: 20)
            
            Text(dish.descriptionDish ?? "")
                .font(.regularText())
                .foregroundStyle(Color.highlightColor2)
                .multilineTextAlignment(.center)
                .frame(width: .infinity, alignment: .center)
            Spacer(minLength: 10)
            
            if #available(iOS 16.0, *) {
                Text("$" + (String(dish.price)))
                    .font(.highlightText())
                    .foregroundColor(.primaryColor1)
                    .monospaced()
            } else {
                Text("$" + (String(dish.price)))
                    .font(.highlightText())
                    .foregroundColor(.primaryColor1)
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    DetailItem(dish: PersistenceController.oneDish())
}
