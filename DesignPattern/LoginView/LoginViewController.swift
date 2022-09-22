//
//  LoginViewController.swift
//  DesignPattern
//
//  Created by Emmanuel Okwara on 11/12/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
    }
    
    private func setupBinders() {
        viewModel.error.bind { [weak self] error in
            if let error = error {
                self?.showErrorAlert(msg: error)
            } else {
                self?.goToHomePage()
            }
        }
    }
    
    private func goToHomePage() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        present(controller, animated: true, completion: nil)
    }
    
    private func showErrorAlert(msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        guard let email = emailField.text,
              let password = passwordField.text
        else {
            showErrorAlert(msg: "Please enter user and password")
            return
        }
        viewModel.login(email: email, password: password)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
