//
//  AppUtils.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 16/02/25.
//

import Foundation

//There is an SSL certification issue while trying to access the URL. Bypass SSL validation by implementing URLSessionDelegate.
//Warning: This Bypass SSL validation should never be used in production.
//Url - "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
class SSLByPass: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
}
