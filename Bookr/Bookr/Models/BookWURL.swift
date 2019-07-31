//
//  Book.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

struct BookWURL: Codable {
	let id: Int
	let isbn: String
	let title: String
	let subtitle: String
	let author: String
	let publisher: String
	let published: String
	let description: String
	let url: String
	let category: String
}
