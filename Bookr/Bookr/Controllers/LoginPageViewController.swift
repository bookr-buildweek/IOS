//
//  LoginPageViewController.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {
	
	var profileController: ProfileController?
	var profiles: Profile? {
		didSet {
			updateViews()
		}
	}
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBAction func signInButton(_ sender: UIButton) {
		guard let email = emailTextField.text,
			let password = passwordTextField.text else { return }
		//TODO: - fix to save users info
//		if profiles == nil {
//			profileController
//		}
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	private func updateViews() {
		
	}


}
