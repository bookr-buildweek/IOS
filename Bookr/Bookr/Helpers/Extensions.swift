//
//  Extensions.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/31/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

extension UITextField {
	var optionalText: String? {
		let trimmedText = self.text?.trimmingCharacters(in: .whitespacesAndNewlines)
		return (trimmedText ?? "").isEmpty ? nil : trimmedText
	}
}

extension UIViewController {
	func fillIn(text field: UITextField, alertMessage: String) -> String? {
		guard let text = field.optionalText else {
			presentInfoAlert(title: "Missing Content", message: alertMessage) { (_) in
				field.becomeFirstResponder()
			}
			return nil
		}
		return text
	}
	
	func presentInfoAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
		let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
		present(alertVC, animated: true, completion: nil)
	}
}
