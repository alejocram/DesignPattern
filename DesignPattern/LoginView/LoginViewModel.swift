//
//  LoginViewModel.swift
//  DesignPattern
//
//  Created by Alejocram on 21/09/22.
//

import Foundation

final class LoginViewModel {
    
    func login(email: String, password: String) {
        NetworkService.share.login(email: email, password: password) { success in
            if success {
                //TODO: Show home page
                print("Successful")
            } else {
                //TODO: Show error alert
                print("Invalid credentials!!!")
            }
        }
    }
    
}
