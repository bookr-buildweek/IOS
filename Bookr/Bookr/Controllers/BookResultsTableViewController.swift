//
//  BookResultsTableViewController.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class BookResultsTableViewController: UITableViewController {
	
	let bookController = BookController()

    override func viewDidLoad() {
        super.viewDidLoad()

		
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookController.books.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "TVBookCell", for: indexPath) as? BooksTableViewCell else { return UITableViewCell() }
		
        
		let book = bookController.books[indexPath.row]
		cell.book = book
		
		
        return cell
    }

	

}
