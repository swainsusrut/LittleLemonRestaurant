//
//  Styles.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 03/02/25.
//

import SwiftUICore
import SwiftUI

struct ButtonStyleYellowColorWide: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("Karla-Bold", size: 15))
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .white : .black)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : Color.primaryColor2)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct ButtonStylePrimaryColor1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("Karla-Bold", size: 15))
            .foregroundColor(configuration.isPressed ? Color.primaryColor1 : .white)
            .padding(10)
            .background(configuration.isPressed ? .white : Color.primaryColor1)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct ButtonStylePrimaryColorReverse: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("Karla-Bold", size: 15))
            .foregroundColor(configuration.isPressed ? .white : Color.primaryColor1)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct ButtonToggleStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("Karla-Bold", size: 15))
            .foregroundColor(configuration.isPressed ? .white : Color.primaryColor1)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

/*
 * The struct confirms to Toggle Style Protocol which allows customization of how a toggle switch appears and behaves.
 * The makeBody() method is required when confirming to this protocol
 * A button is used instead of the defaukt toggle switch and a label is placed on top of the button
 */
struct MyToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Button {
                configuration.isOn.toggle()
            } label: {
                configuration.label
            }
            .font(.custom("Karla-Regular", size: 15))
            .foregroundColor(configuration.isOn ? Color.primaryColor1 : Color.highlightColor1)
            .padding([.leading, .trailing], 12)
            .padding([.top, .bottom], 10)
        }
        .background {
            if configuration.isOn {
                Color.secondaryColor2
            } else {
                Color.highlightColor2
            }
        }
        .cornerRadius(10)
    }
}

extension Font {
    static func displayFont() -> Font {
        return Font.custom("Alike-Regular", size: 40).weight(.medium)
    }
    
    static func subTitleFont() -> Font {
        return Font.custom("MarkaziText-Medium", size: 32)
    }
    
    static func leadText() -> Font {
        return Font.custom("Alike-Regular", size: 16).weight(.medium)
    }
    
    static func regularText() -> Font {
        return Font.custom("MarkaziText-Medium", size: 18)
    }
    
    static func sectionTitle() -> Font {
        return Font.custom("Karla-Regular", size: 18).weight(.black)
    }
    
    static func sectionCategories() -> Font {
        return Font.custom("Karla-Regular", size: 16).weight(.heavy)
    }
    
    static func paragraphText() -> Font {
        return Font.custom("Karla-Regular", size: 14)
    }
    
    static func highlightText() -> Font {
        return Font.custom("Karla-Regular", size: 14).weight(.medium)
    }
}

extension Text {
    func onboardingTextStyle() -> some View {
        if #available(iOS 16.0, *) {
            return self
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.primaryColor1)
                .font(.custom("Karla-Bold", size: 15))
                .fontWeight(.bold)
        } else {
            return self
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.primaryColor1)
                .font(.custom("Karla-Bold", size: 15))
        }
    }
}

extension TextField {
    func onboardingTextStyle() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.highlightColor2)
            .font(.custom("Karla-Bold", size: 14))
            .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.secondaryColor1, lineWidth: 2)
                )
    }
}

extension Color {
    static let primaryColor1 = Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1))
    static let primaryColor2 = Color(#colorLiteral(red: 0.9568627477, green: 0.8078432088, blue: 0.07843137532, alpha: 1))
    
    static let secondaryColor1 = Color(#colorLiteral(red: 0.989240706, green: 0.5802358389, blue: 0.4141188264, alpha: 1))
    static let secondaryColor2 = Color(#colorLiteral(red: 1, green: 0.8488721251, blue: 0.7164030075, alpha: 1))
    
    static let highlightColor1 = Color(#colorLiteral(red: 0.9276351333, green: 0.9375831485, blue: 0.9331009984, alpha: 1))
    static let highlightColor2 = Color(#colorLiteral(red: 0.1999999881, green: 0.1999999881, blue: 0.1999999881, alpha: 1))
}
