//
//  Onboarding.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 06/02/25.
//

import Foundation
import SwiftUI

struct Onboarding: View {
    @StateObject private var viewModel = ViewModel()

    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Header()
                    Hero()
                        .padding()
                        .background(Color.primaryColor1)
                        .frame(maxWidth: .infinity, maxHeight: 240)
                    /*
                        The header and the hero, display information that is fixed and does not change when the screen changes, like the Little Lemon logo and information about a specific restaurant branch.
                     */
                    VStack(spacing: 10, content: {
                        NavigationLink(destination: Home(), isActive: $isLoggedIn) { }
                        Text("First name *")
                            .onboardingTextStyle()
                        TextField("First Name", text: $firstName)
                            .onboardingTextStyle()
                            .keyboardType(.alphabet)
                        Text("Last name *")
                            .onboardingTextStyle()
                        TextField("Last Name", text: $lastName)
                            .onboardingTextStyle()
                            .keyboardType(.alphabet)
                        Text("E-mail *")
                            .onboardingTextStyle()
                        TextField("E-mail", text: $email)
                            .onboardingTextStyle()
                            .keyboardType(.emailAddress)
                    })
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .padding()
                    
                    if viewModel.errorMessageShow {
                        withAnimation() {
                            Text(viewModel.errorMessage)
                                .onboardingTextStyle()
                                .foregroundColor(.red)
                                .padding(.init(top: 0, leading: 20, bottom: 5, trailing: 20))
                        }
                    }
                    
                    Button("Register") {
                        if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            UserDefaults.standard.set(true, forKey: kOrderStatuses)
                            UserDefaults.standard.set(true, forKey: kPasswordChanges)
                            UserDefaults.standard.set(true, forKey: kSpecialOffers)
                            UserDefaults.standard.set(true, forKey: kNewsletter)
                            firstName = ""
                            lastName = ""
                            email = ""
                            isLoggedIn = true
                        }
                    }
                    .buttonStyle(ButtonStyleYellowColorWide())
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
