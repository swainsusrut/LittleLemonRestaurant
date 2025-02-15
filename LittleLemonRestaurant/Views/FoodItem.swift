//
//  FoodItem.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 29/01/25.
//

import SwiftUI

struct FoodItem: View {
    let dish: Dish

    var body: some View {
        HStack {
            VStack(spacing: 5) {
                Text(dish.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.sectionCategories())
                    .foregroundColor(.black)
                Text(dish.descriptionDish ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.paragraphText())
                    .foregroundColor(.primaryColor1)
                    .lineLimit(4)
                Spacer(minLength: 3)
                if #available(iOS 16.0, *) {
                    Text("$" + (String(dish.price)))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.highlightText())
                        .foregroundColor(.primaryColor1)
                        .monospaced()
                } else {
                    Text("$" + (String(dish.price)))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.highlightText())
                        .foregroundColor(.primaryColor1)
                }
            }
            
            //Download and load Image from Url
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding()
        .frame(maxHeight: 170)
    }
}

#Preview {
    FoodItem(dish: PersistenceController.oneDish())
}
