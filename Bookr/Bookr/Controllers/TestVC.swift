//
//  TestVC.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/29/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class TestVC: UIViewController {
	
	var networkManager = NetworkManager(token: nil)
	let settingsController = SettingsController()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }

	@IBAction func loginBtn(_ sender: Any) {
		var loginCredentials = LoginRequest(email: "", password: "")
		
		if let credentials = settingsController.userCredentials {
			loginCredentials = credentials
		} else {
			loginCredentials = LoginRequest(email: "jeff@bookr.com", password: "12345")
		}
		
		networkManager.login(credentials: loginCredentials) { (login, error) in
			if let error = error {
				print(error)
			}
			if let login = login {
				print(login)
				self.settingsController.userCredentials = loginCredentials
				self.settingsController.userToken = login.token
			}
		}
	}
	
	@IBAction func registerBtn(_ sender: Any) {
		let newUser = RegisterRequest(firstName: "Jeff", lastName: "Santana", email: "jeff@bookr.com", password: "12345")
		networkManager.register(newUser: newUser) { (login, error) in
			if let error = error {
				print(error)
			}
			if let login = login {
				print(login)
				self.settingsController.userCredentials = LoginRequest(email: newUser.email, password: newUser.password)
				self.settingsController.userToken = login.token
			}
		}
	}
	
	@IBAction func getUser(_ sender: Any) {
		networkManager.getUserBy(id: 4) { (user, error) in
			if let error = error {
				print(error)
			}
			if let user = user {
				print(user)
			}
		}
	}
	
	@IBAction func allBooks(_ sender: Any) {
		networkManager.getAllBooks { (books, error) in
			if let error = error {
				print(error)
			}
			if let books = books {
				print(books)
			}
		}
	}
	
	@IBAction func getBook(_ sender: Any) {
		networkManager.getBookBy(id: 1) { (book, error) in
			if let error = error {
				print(error)
			}
			if let book = book {
				print(book)
			}
		}
	}
	
	@IBAction func userReviews(_ sender: Any) {
		networkManager.getUserReviewsBy(userId: 4) { (reviews, error) in
			if let error = error {
				print(error)
			}
			if let reviews = reviews {
				print(reviews)
			}
		}
	}
	
	@IBAction func getReview(_ sender: Any) {
		networkManager.getReviewBy(id: 1) { (review, error) in
			if let error = error {
				print(error)
			}
			if let review = review {
				print(review)
			}
		}
	}
	
	@IBAction func postReview(_ sender: Any) {
		networkManager.post(review: ReviewRequest(bookId: 1, review: "Thought it was aight", userId: 4, ratings: 3)) { (review, error) in
			if let error = error {
				print(error)
			}
			if let review = review {
				print(review)
			}
		}
	}
	
	@IBAction func editReview(_ sender: Any) {
		networkManager.editReview(data: ReviewRequest(bookId: 1, review: "Thought it was great!", userId: 4, ratings: 5)) { (review, error) in
			if let error = error {
				print(error)
			}
			if let review = review {
				print(review)
			}
		}
	}
	
	@IBAction func deleteReview(_ sender: Any) {
		networkManager.post(review: ReviewRequest(bookId: 1, review: "Thought it was aight", userId: 4, ratings: 3)) { (review, error) in
			if let error = error {
				print(error)
			}
			if let review = review {
				print(review)
			}
		}
	}
}
