//
//  User.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/29/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

struct User: Codable {
	let id: Int
	let firstName: String
	let lastName: String
	let email: String
}
