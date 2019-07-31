//
//  LoginPageViewController.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {
	
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
	
	@IBAction func signInButton(_ sender: UIButton) {
		guard let email = emailTextField.optionalText, let password = passwordTextField.optionalText else { return }
		let login = LoginRequest(email: email, password: password)
		
		NetworkManager.shared.login(credentials: login) { (results, error) in
			if let error = error {
				print(error)
			} else if let results = results {
				print(results)
				SettingsController.shared.persist(credentials: login)
				SettingsController.shared.userToken = results.token
				#warning("Create segue to Profile")
			}
		}
	}
	
	//MARK: - Helpers
	
	private func configTextFields() {
		emailTextField.delegate = self
		passwordTextField.delegate = self
	}


}

//MARK: - UITextField Delegate

extension LoginPageViewController: UITextFieldDelegate {
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
