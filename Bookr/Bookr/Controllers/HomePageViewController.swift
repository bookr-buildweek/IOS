//
//  HomePageViewController.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/29/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
	

	@IBOutlet weak var bookFilterCollectionView: UICollectionView!
	
	
	var bookController = BookController()
	var book: Book?

	@IBOutlet weak var collectionView: UICollectionView!

	override func viewDidLoad() {
		super.viewDidLoad()

		configCollectionView()
	}
	
	@IBAction func profileBtn(_ sender: Any) {
		SettingsController.shared.isSaveCredentials = false
	}
	
	private func configCollectionView() {
		collectionView.dataSource = self
		collectionView.delegate = self
	}
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	
	var filterImages: [UIImage] {
		let names = "art ball book globe math science".components(separatedBy: " ").map { "\($0)Filter" }
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
