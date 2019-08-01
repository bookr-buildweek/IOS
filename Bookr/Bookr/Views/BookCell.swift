//
//  BookCell.swift
//  Bookr
//
//  Created by Jeffrey Santana on 8/1/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
	
	@IBOutlet weak var coverImgView: UIImageView!
	@IBOutlet weak var titleLbl: UILabel!
	@IBOutlet weak var authorLbl: UILabel!
	@IBOutlet weak var publisherLbl: UILabel!
	@IBOutlet weak var starRatingImgView: UIImageView!
	
	var book: BookWURL? {
		didSet {
			configcell()
		}
	}

	private func configcell() {
		guard let book = book else { return }
		
		setImage(from: book.url)
		titleLbl.text = book.title
		authorLbl.text = book.author
		publisherLbl.text = "\(book.publisher) \(book.published)"
		
		starRatingImgView.isHidden = true
	}
	
	private func setImage(from urlString: String) {
		guard let imgURL = URL(string: urlString) else { return }
		coverImgView.load(url: imgURL)
	}
}
