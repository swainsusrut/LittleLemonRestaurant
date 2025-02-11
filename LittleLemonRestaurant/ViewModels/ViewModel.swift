//
//  ViewModel.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 06/02/25.
//

import Foundation

public let kFirstName = "first name key"
public let kLastName = "last name key"
public let kEmail = "e-mail key"
public let kIsLoggedIn = "is loggedIn key"

class ViewModel: ObservableObject {
    
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
        
    @Published var errorMessage = ""
    @Published var errorMessageShow = false

    @Published var searchText = ""
    
    func validateUserInput(firstName: String, lastName: String, email: String) -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            errorMessage = "All fields are mandatory"
            errorMessageShow = true
            return false
        }
        
        guard email.contains("@") else {
            errorMessage = "Invalid Email address"
            errorMessageShow = true
            return false
        }
        
        let email = email.split(separator: "@")
        
        guard email.count == 2 else {
            errorMessage = "Invalid Email address"
            errorMessageShow = true
            return false
        }
        
        guard email[1].contains(".") else {
            errorMessage = "Invalid Email address"
            errorMessageShow = true
            return false
        }
        
        errorMessageShow = false
        errorMessage = ""
        return true
    }
}
