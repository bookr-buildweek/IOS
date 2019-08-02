//
//  LoginVC.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
	
	//MARK: - IBOutlets
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	//MARK: - Properties
	
	
	//MARK: - Life Cycle
	
    override func viewDidLoad() {
        super.viewDidLoad()

		configTextFields()
    }
	
	//MARK: - IBActions
	
	@IBAction func googleSignInBtn(_ sender: Any) {
		
	}
	
	@IBAction func facebookSignInBtn(_ sender: Any) {
		
	}
	
	@IBAction func signInButton(_ sender: UIButton) {
		guard let email = fillIn(text: emailTextField, alertMessage: "Email"),
			let password = fillIn(text: passwordTextField, alertMessage: "Password")
			else { return }
		let login = LoginRequest(email: email, password: password)
		
		NetworkManager.shared.login(credentials: login) { (result, error) in
			if let error = error {
				DispatchQueue.main.async {
					self.presentInfoAlert(title: "Error", message: error)
				}
			} else if let result = result {
				SettingsController.shared.loginProcedure(result)
				SettingsController.shared.persist(credentials: login)
				DispatchQueue.main.async {
					self.performSegue(withIdentifier: "ShowMainSegue", sender: nil)
				}
			}
		}
	}
	
	@IBAction func createAccountBtn(_ sender: Any) {
		#warning("link to register screen without creating an infinite loop")
	}
	
	//MARK: - Helpers
	
	private func configTextFields() {
		emailTextField.delegate = self
		passwordTextField.delegate = self
	}


}

//MARK: - UITextField Delegate

extension LoginVC: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		let nextTag = textField.tag + 1
		
		if let nextResponder = textField.superview?.viewWithTag(nextTag) {
			nextResponder.becomeFirstResponder()
		} else {
			textField.resignFirstResponder()
		}
		
		return true
	}
}
