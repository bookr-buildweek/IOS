//
//  BooksTableViewCell.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/31/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

	@IBOutlet weak var bookTitleLabel: UILabel!
	@IBOutlet weak var bookImageView: UIImageView!
	@IBOutlet weak var bookAuthorLabel: UILabel!
	@IBOutlet weak var bookCompanyLabel: UILabel!
	@IBOutlet weak var bookRatingImageView: UIImageView!
	
	var book: Book? {
		didSet {
			updateViews()
		}
	}

	func updateViews() {
		guard let book = book else { return }
		
		
	}
	
}
