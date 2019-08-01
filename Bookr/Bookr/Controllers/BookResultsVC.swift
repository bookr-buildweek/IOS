//
//  BookResultsVC.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class BookResultsVC: UIViewController {
	
	//MARK: - IBOutlets
	
	@IBOutlet weak var tableView: UITableView!
	
	//MARK: - Properties
	
	var category: String?
	var bookResults = [BookWURL]()
	
	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.dataSource = self
		loadBooks()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let bookReviewsVC = segue.destination as? BookReviewsVC {
			guard let indexPath = tableView.indexPathForSelectedRow else { return }
			bookReviewsVC.bookReference = bookResults[indexPath.row]
		}
	}
	
	//MARK: - IBActions
	
	@IBAction func profileBtn(_ sender: Any) {
		
	}
	
	@IBAction func homePageBtn(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	//MARK: - Helpers
	
	private func loadBooks() {
		NetworkManager.shared.getAllBooks { (results, error) in
			if let error = error {
				self.presentInfoAlert(title: "Error", message: error)
			} else if let results = results {
				self.bookResults = self.filterSort(books: results)
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			}
		}
	}
	
	private func filterSort(books: [BookWURL]) -> [BookWURL] {
		guard let category = category?.lowercased() else { return [BookWURL]()}
		return books.filter({$0.category.lowercased() == category}).sorted(by: {$0.title < $1.title})
	}

}

extension BookResultsVC: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return bookResults.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as? BookCell else { return UITableViewCell() }
		
		cell.book = bookResults[indexPath.row]
		
		return cell
	}
}
