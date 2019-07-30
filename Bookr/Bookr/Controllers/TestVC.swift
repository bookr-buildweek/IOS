//
//  TestVC.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/29/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class TestVC: UIViewController {
	
	var networkManager = NetworkManager(token: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
		networkManager.login(credentials: LoginRequest(email: "jeffBookr@gmail.com", password: "12345")) { (login, error) in
			if let error = error {
				print(error)
			}
			if let login = login {
				print(login)
			}
		}
    }

}
