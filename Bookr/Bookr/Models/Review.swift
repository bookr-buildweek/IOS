//
//  Review.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

struct Review: Codable {
	let id: Int
	let userId: Int
	let ratings: Int
	let review: String
	let bookId: Int
	
	enum CodingKeys: String, CodingKey {
		case id
		case userId = "reviewer"
		case ratings
		case review
		case bookId = "bookId"
	}
}
