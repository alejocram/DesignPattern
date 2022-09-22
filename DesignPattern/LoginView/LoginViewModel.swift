//
//  LoginViewModel.swift
//  DesignPattern
//
//  Created by Alejocram on 21/09/22.
//

import Foundation

final class LoginViewModel {
    var error: ObservableObject<String?> = ObservableObject(nil)
    
    func login(email: String, password: String) {
        NetworkService.share.login(email: email, password: password) { [weak self] success in
            if success {
                self?.error.value = nil
                print("Successful")
            } else {
                let errorMsg: String = "Invalid credentials!!!"
                self?.error.value = errorMsg
            }
        }
    }
    
}
