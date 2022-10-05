//
//  HomeViewModel.swift
//  DesignPattern
//
//  Created by Alejocram on 29/09/22.
//

import Foundation

final class HomeViewModel {
    var welcomeMsg: ObservableObject<String?> = ObservableObject(nil)
    
    func showMessage() {
        let user = NetworkService.share.getLoggedInUser()
        welcomeMsg.value = "Hello, \(user.firstName)"
    }
}
