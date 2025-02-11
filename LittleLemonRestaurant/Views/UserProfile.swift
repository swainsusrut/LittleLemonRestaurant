//
//  UserProfile.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 11/02/25.
//

import SwiftUI

struct UserProfile: View {
    @StateObject private var viewModel = ViewModel()
    
    /*
     @Environment(\.presentationMode) var presentation
     This will automatically reference the presentation environment in SwiftUI which will allow you to reach the navigation logic.
     */
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var isLoggedOut = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            NavigationLink(destination: Onboarding(), isActive: $isLoggedOut) { }
            
            VStack(spacing: 15) {
                VStack(spacing: 15) {
                    Text("Personal Information")
                        .onboardingTextHeaderStyle()
                        .frame(maxWidth: .infinity, alignment: .center)
                    Image("Profile")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(maxHeight: 150)
                        .clipShape(Circle())
                    HStack(spacing: 0) {
                        Button("Change") { }
                            .buttonStyle(ButtonStylePrimaryColor1())
                        Button("Remove") { }
                            .buttonStyle(ButtonStylePrimaryColorReverse())
                    }
                }
                
                VStack{
                    Text("First name")
                        .onboardingTextStyle()
                    TextField("First Name", text: $firstName)
                        .profileTextStyle()
                }
                
                VStack {
                    Text("Last name")
                        .onboardingTextStyle()
                    TextField("Last Name", text: $lastName)
                        .profileTextStyle()
                }
                
                VStack {
                    Text("E-mail")
                        .onboardingTextStyle()
                    TextField("E-mail", text: $email)
                        .profileTextStyle()
                        .keyboardType(.emailAddress)
                }
            }
            .padding()
                        
            HStack(spacing: 2) {
                Button(action: {
                    firstName = viewModel.firstName
                    lastName = viewModel.lastName
                    email = viewModel.email
                    /*
                     When executed, it will automatically tell the NavigationView to go back to the previous screen which is Onboarding screen, thus simulating logout.
                     */
                    self.presentation.wrappedValue.dismiss()
                }) {
                    Text("Discard Changes")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(ButtonStylePrimaryColorReverse())
                
                Button(action: {
                    if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        self.presentation.wrappedValue.dismiss()
                    }
                }) {
                    Text("Save Changes")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(ButtonStylePrimaryColor1())
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 10)
            
            Button("Log out") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                UserDefaults.standard.set("", forKey: kFirstName)
                UserDefaults.standard.set("", forKey: kLastName)
                UserDefaults.standard.set("", forKey: kEmail)
                isLoggedOut = true
            }
            .buttonStyle(ButtonStyleYellowColorWide())
            
            if viewModel.errorMessageShow {
                withAnimation() {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
            }
        }
        
        .onAppear {
            firstName = viewModel.firstName
            lastName = viewModel.lastName
            email = viewModel.email
        }
        .navigationTitle(Text("Personal information"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserProfile()
}
