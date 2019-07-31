//
//  BookWReviews.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/31/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

struct BookWReviews: Codable {
	let id: Int
	let isbn: String
	let title: String
	let subtitle: String
	let author: String
	let publisher: String
	let published: String
	let description: String
	let category: String
	let reviews: [Review]
}
