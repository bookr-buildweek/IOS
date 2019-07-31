//
//  HeroPageViewController.swift
//  Bookr
//
//  Created by Taylor Lyles on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class HeroPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		DispatchQueue.main.asyncAfter(deadline: .now()+1) {
			self.performSegue(withIdentifier: "MainToProfileShowSegue", sender: nil)
		}
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}