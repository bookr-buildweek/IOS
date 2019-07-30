//
//  SettingsController.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation
import KeychainAccess

class SettingsController {
	private let defaults = UserDefaults.standard
	private let keychain = Keychain(service: "com.build-week.Bookr")
	
	//MARK: - User Credentials
	
	private let UserIdKey = "user_id_key"
	private let UserEmailKey = "user_email_key"
	private let UserPasswordKey = "user_password_key"
	
	var userCredentials: LoginRequest? {
		get {
			guard let email = keychain[UserEmailKey], let password = keychain[UserPasswordKey] else { return nil }
			return LoginRequest(email: email, password: password)
		}
		set {
			guard let newValue = newValue else {
				keychain[UserEmailKey] = nil
				keychain[UserPasswordKey] = nil
				return
			}
			keychain[UserEmailKey] = newValue.email
			keychain[UserPasswordKey] = newValue.password
		}
	}
	
	var userToken: String? {
		get {
			return keychain[AccessKeys.TokenKey]
		}
		set {
			guard let newToken = newValue else {
				keychain[AccessKeys.TokenKey] = nil
				return
			}
			keychain[AccessKeys.TokenKey] = newToken
		}
	}
	
	//MARK: Life Cycle
	
	init() {
		//This allows to clear the keychain when is a fresh installation, in order to remove the saved passwords.
		let freshInstallationKey = "FreshInstallation"
		if defaults.value(forKey: freshInstallationKey) == nil {
			_ = try? keychain.removeAll()
			defaults.set(false, forKey: freshInstallationKey)
		}
	}
}
