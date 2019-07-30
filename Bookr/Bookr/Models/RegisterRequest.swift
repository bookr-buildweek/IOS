//
//  RegisterRequest.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

struct RegisterRequest: Codable {
	let firstName: String
	let lastName: String
	let email: String
	let password: String
}
