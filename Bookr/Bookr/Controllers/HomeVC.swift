//
//  HomeVC.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/29/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
	
	//MARK: - IBOutlets
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	//MARK: - Properties
	
	let categories = ["art", "ball", "languageArts", "history", "mathematics", "science"]
	
	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configCollectionView()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let bookResultsVC = segue.destination as? BookResultsVC {
			guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
			bookResultsVC.category = categories[indexPath.item]
		}
	}
	
	//MARK: - IBActions
	
	@IBAction func profileBtn(_ sender: Any) {
		SettingsController.shared.isSaveCredentials = false
	}
	
	//MARK: - Helpers
	
	private func configCollectionView() {
		collectionView.dataSource = self
		collectionView.delegate = self
	}
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
	
	var filterImages: [UIImage] {
		let names = categories.map { "\($0)Filter" }
		let images = names.compactMap { UIImage(named: $0) }
		return images
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return filterImages.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? FilterCollectionViewCell else { return  UICollectionViewCell() }
		
		cell.filterImageView.image = filterImages[indexPath.item]
		return cell
	}
}
