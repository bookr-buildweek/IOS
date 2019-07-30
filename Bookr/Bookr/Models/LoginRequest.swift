//
//  LoginRequest.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/29/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

struct LoginRequest: Codable {
	let email: String
	let password: String
}
