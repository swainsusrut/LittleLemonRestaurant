//
//  FetchedObjects.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 15/02/25.
//

import CoreData
import Foundation
import SwiftUI

//Reusable SwiftUI component for fetching and displaying Core Data objects where T represents CoreData Entity and Content represents SwiftUI view that will display the fetched results.
//FetchedObjects is a struct that replaces @FetchRequest and serves to use dynamic predicates and sort descriptors.
struct FetchedObjects<T, Content>: View where T : NSManagedObject, Content : View {
    
    //A closure that takes an array of fetched objects and returns a view
    let content: ([T]) -> Content
    
    //Retrieves entities from a Core Data persistent store
    var request: FetchRequest<T>
    //A collection of results retrieved from a Core Data store.
    var results: FetchedResults<T>{ request.wrappedValue }
    
    init(predicate: NSPredicate = NSPredicate(value: true), sortDescriptors: [NSSortDescriptor] = [],
         //A custom parameter attribute that constructs views from closures
         @ViewBuilder content: @escaping ([T]) -> Content)
    {
        //Assigns the given view to content and creates a FetchedRequest using Core Data's entity model
        self.content = content
        self.request = FetchRequest(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: predicate)
    }
    
    var body: some View {
        //Pass the fetched results into content closure
        self.content(results.map { $0 })
    }
}
