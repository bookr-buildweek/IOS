//
//  BookDetailsCell.swift
//  Bookr
//
//  Created by Jeffrey Santana on 8/1/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class BookDetailsCell: UITableViewCell {

	@IBOutlet weak var titleLbl: UILabel!
	@IBOutlet weak var avgRatingImgView: UIImageView!
	@IBOutlet weak var coverImgView: UIImageView!
	
	var book: (title: String, avgRating: Int, coverUrlString: String)? {
		didSet {
			configCell()
		}
	}
	
	private func configCell() {
		guard let book = book else { return }
		
		titleLbl.text = book.title
		setImage(from: book.coverUrlString)
	}
	
	private func setImage(from urlString: String) {
		guard let imgURL = URL(string: urlString) else { return }
		coverImgView.load(url: imgURL)
	}
}

