//
//  HeroPageViewController.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class HeroPageViewController: UIViewController {
	
	//MARK: - IBOutlets
	
	@IBOutlet weak var loginBtn: UIButton!
	@IBOutlet weak var startBtn: UIButton!
	
	//MARK: - Properties
	
	
	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		loginBtn.isHidden = true
		startBtn.isHidden = true
		
		checkForLogin()
	}
	
	//MARK: - IBActions
	
	@IBAction func unwindToHeroPage(_ sender: UIStoryboardSegue) {
		
	}
	
	//MARK: - Helpers

	private func checkForLogin() {
		if SettingsController.shared.isSaveCredentials {
			DispatchQueue.main.asyncAfter(deadline: .now()+1) {
				self.performSegue(withIdentifier: "ShowMainSegue", sender: nil)
			}
		} else {
			loginBtn.isHidden = false
			startBtn.isHidden = false
		}
	}
}
