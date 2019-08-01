//
//  CreatePageViewController.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class CreatePageViewController: UIViewController {

	//MARK: - IBOutlets
	
	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var passwordConfirmTextField: UITextField!
	
	//MARK: - Properties
	
	
	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configTextFields()
	}
	
	//MARK: - IBActions
	
	@IBAction func googleSignUpBtn(_ sender: Any) {
		
	}
	
	@IBAction func FacebookSignUpBtn(_ sender: Any) {
		
	}
	
	@IBAction func createBtn(_ sender: Any) {
		guard let firstName = fillIn(text: firstNameTextField, alertMessage: "First Name"),
			let lastName = fillIn(text: lastNameTextField, alertMessage: "Last Name"),
			let email = fillIn(text: emailTextField, alertMessage: "Email"),
			let password = fillIn(text: passwordTextField, alertMessage: "Password"),
			let passwordConfirm = fillIn(text: passwordConfirmTextField, alertMessage: "Password Confirmation")
		else { return }
		
		guard password == passwordConfirm else {
			presentInfoAlert(title: "Mismatch", message: "Password Confirmation") { (_) in
				self.passwordConfirmTextField.text = ""
				self.passwordConfirmTextField.becomeFirstResponder()
			}
			return
		}
		
		let newUser = RegisterRequest(firstName: firstName, lastName: lastName, email: email, password: password)
		
		NetworkManager.shared.register(newUser: newUser) { (result, error) in
			if let error = error {
				self.presentInfoAlert(title: "Error", message: error)
			}
		}
		
	}
	
	@IBAction func signInBtn(_ sender: Any) {
		#warning("link to sign in screen without creating an infinite loop")
	}
	
	//MARK: - Helpers
	
	private func configTextFields() {
		firstNameTextField.delegate = self
		lastNameTextField.delegate = self
		emailTextField.delegate = self
		passwordTextField.delegate = self
		passwordConfirmTextField.delegate = self
	}
	
	
}

//MARK: - UITextField Delegate

extension CreatePageViewController: UITextFieldDelegate {
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
