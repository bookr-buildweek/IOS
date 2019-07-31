//
//  TestVC.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/29/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class TestVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }

	@IBAction func loginBtn(_ sender: Any) {
		var loginCredentials = LoginRequest(email: "", password: "")
		
		if let credentials = SettingsController.shared.userCredentials {
			loginCredentials = credentials
		} else {
			loginCredentials = LoginRequest(email: "jeff@bookr.com", password: "12345")
		}
		
		NetworkManager.shared.login(credentials: loginCredentials) { (login, error) in
			if let error = error {
				print(error)
			}
			if let login = login {
				print(login)
//				SettingsController.shared.userCredentials = loginCredentials
				SettingsController.shared.userToken = login.token
			}
		}
	}
	
	@IBAction func registerBtn(_ sender: Any) {
		let newUser = RegisterRequest(firstName: "Jeff", lastName: "Santana", email: "jeff@bookr.com", password: "12345")
		NetworkManager.shared.register(newUser: newUser) { (login, error) in
			if let error = error {
				print(error)
			}
			if let login = login {
				print(login)
//				SettingsController.shared.userCredentials = LoginRequest(email: newUser.email, password: newUser.password)
				SettingsController.shared.userToken = login.token
			}
		}
	}
	
	@IBAction func getUser(_ sender: Any) {
		NetworkManager.shared.getUserBy(id: 4) { (user, error) in
			if let error = error {
				print(error)
			}
			if let user = user {
				print(user)
			}
		}
	}
	
	@IBAction func allBooks(_ sender: Any) {
		NetworkManager.shared.getAllBooks { (books, error) in
			if let error = error {
				print(error)
			}
			if let books = books {
				print(books)
			}
		}
	}
	
	@IBAction func getBook(_ sender: Any) {
		NetworkManager.shared.getBookBy(id: 1) { (book, error) in
			if let error = error {
				print(error)
			}
			if let book = book {
				print(book)
			}
		}
	}
	
	@IBAction func userReviews(_ sender: Any) {
		NetworkManager.shared.getUserReviewsBy(userId: 4) { (reviews, error) in
			if let error = error {
				print(error)
			}
			if let reviews = reviews {
				print(reviews)
			}
		}
	}
	
	@IBAction func getReview(_ sender: Any) {
		NetworkManager.shared.getReviewBy(reviewId: 6) { (review, error) in
			if let error = error {
				print(error)
			}
			if let review = review {
				print(review)
			}
		}
	}
	
	@IBAction func postReview(_ sender: Any) {
		NetworkManager.shared.post(review: ReviewRequest(review: "Thought it was aight", userId: 4, ratings: 3), onBookId: 1) { (review, error) in
			if let error = error {
				print(error)
			}
			if let review = review {
				print(review)
			}
		}
	}
	
	@IBAction func editReview(_ sender: Any) {
		NetworkManager.shared.editReview(reviewId: 6, data: ReviewRequest(review: "Thought it was great!", userId: 4, ratings: 5)) { (review, error) in
			if let error = error {
				print(error)
			}
			if let review = review {
				print(review)
			}
		}
	}
	
	@IBAction func deleteReview(_ sender: Any) {
		NetworkManager.shared.deleteReview(reviewId: 6) { (review, error) in
			if let error = error {
				print(error)
			}
			if let review = review {
				print(review)
			}
		}
	}
}
