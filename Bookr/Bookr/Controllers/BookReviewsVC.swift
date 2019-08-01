//
//  BookReviewsVC.swift
//  Bookr
//
//  Created by Jeffrey Santana on 8/1/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class BookReviewsVC: UIViewController {
	
	//MARK: - IBOutlets
	
	@IBOutlet weak var tableView: UITableView!
	
	//MARK: - Properties
	
	var bookReference: BookWURL?
	private var book: BookWReviews?
	private var reviews = [Review]()
	
	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.dataSource = self
		loadBook()
	}
	
	//MARK: - IBActions
	
	
	//MARK: - Helpers
	
	private func loadBook() {
		guard let bookId = bookReference?.id else { return }
		NetworkManager.shared.getBookBy(id: bookId) { (result, error) in
			if let error = error {
				self.presentInfoAlert(title: "Error", message: error)
				DispatchQueue.main.async {
					self.navigationController?.popViewController(animated: true)
				}
			} else if let result = result {
				self.book = result
				self.reviews = result.reviews.sorted(by: {$0.id < $1.id})
			}
		}
	}

}

extension BookReviewsVC: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 6
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
}
