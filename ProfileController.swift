//
//  ProfileController.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

class ProfileController: Codable {
	
	private var profiles = [Profile]()
	
	func saveToPersistentStore() {
		guard let url = profilesURL else { return }
		
		do {
			let encoder = PropertyListEncoder()
			let booksData = try encoder.encode(profiles)
			try booksData.write(to: url)
		} catch {
			print("Error saving profile data: \(error)")		}
	}
	
	func loadToPersistentStore() {
		let fm = FileManager.default
		guard let url = profilesURL,
			fm.fileExists(atPath: url.path) else { return }
		
		do {
			let data = try Data(contentsOf: url)
			let decoder = PropertyListDecoder()
			profiles = try decoder.decode([Profile].self, from: data)
		} catch {
			print("Error loading books data: \(error)")
		}
	}
	
	// MARK: - Private
	
	private var profilesURL: URL? {
		let fm = FileManager.default
		guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return dir.appendingPathComponent("profiles.plist")
	}
	
}

protocol ProfileControllerProtocol {
	var profileController: ProfileController? {get set}
}
