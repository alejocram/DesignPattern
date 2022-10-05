//
//  NetworkService.swift
//  DesignPattern
//
//  Created by Alejocram on 21/09/22.
//

import Foundation

final class NetworkService {
    static let share = NetworkService()
    private var user: User?
    
    init() {}
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if email == "test@test.com" && password == "password" {
                self?.user = User(firstName: "Alejo", lastName: "Cram", email: "alejocram@gmail.com", age: 37)
                completion(true)
            } else {
                self?.user = nil
                completion(false)
            }
        }
    }
    
    func getLoggedInUser() -> User {
        return user!
    }
    
}
