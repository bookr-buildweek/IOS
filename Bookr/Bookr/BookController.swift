//
//  BookController.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation
//
//class BookController {
//	var books: [Book] {
//		var results = [Book(title: String, author: String, company: String, image: UIImage, rating: Double)]
//	}
//	return results
//}
//

class BookController: Codable {
	
	private(set) var books = [Book]()
	
	func saveToPersistentStore() {
		guard let url = bookListURL else { return }
		
		do {
			let encoder = PropertyListEncoder()
			let booksData = try encoder.encode(books)
			try booksData.write(to: url)
		} catch {
			print("Error saving books data: \(error)")		}
	}
	
	func loadToPersistentStore() {
		let fm = FileManager.default
		guard let url = bookListURL,
			fm.fileExists(atPath: url.path) else { return }
		
		do {
			let data = try Data(contentsOf: url)
			let decoder = PropertyListDecoder()
			books = try decoder.decode([Book].self, from: data)
		} catch {
			print("Error loading books data: \(error)")
		}
	}
	
	// MARK: - Private
	
	private var bookListURL: URL? {
		let fm = FileManager.default
		guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return dir.appendingPathComponent("books.plist")
	}
	
}
	

protocol BookControllerProtocol {
	var bookController: BookController? {get set}
}
