//
//  MenuList.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 03/02/25.
//

import Foundation
import CoreData

struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
    
    static func getMenuData(viewContext: NSManagedObjectContext) {
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        let request = URLRequest(url: url!)
        
        let session = URLSession(configuration: .default, delegate: SSLByPass(), delegateQueue: nil)
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                
                //Decodes the received json
                if let fullMenu = try? decoder.decode(MenuList.self, from: data) {
                    for dish in fullMenu.menu {
                        let newDish = Dish(context: viewContext)
                        newDish.title = dish.title
                        newDish.price = Float(dish.price) ?? 0.0
//                        if let price = Float?(dish.price) {
//                            newDish.price = price
//                        } else {
//                            newDish.price = 0.0
//                        }
                        newDish.descriptionDish = dish.descriptionDish
                        newDish.image = dish.image
                        newDish.category = dish.category
                    }
                    //And saves it to Core Data
                    try? viewContext.save()
                } else {
                    print(error.debugDescription.description)
                }
            } else {
                print(error.debugDescription.description)
            }
        }
        dataTask.resume()
    }
}
