//
//  UserAPIManager.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/30/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

extension NetworkManager {
	
	func register(newUser: RegisterRequest, completion: @escaping (_ login: Login?, _ error: String?) -> ()) {
		router.request(.register(request: newUser)) { (data, response, error) in
			let returnRequest = self.getObject(data, response, error, Login.self)
			completion(returnRequest.0, returnRequest.1)
		}
	}

	func login(credentials: LoginRequest, completion: @escaping (_ login: Login?, _ error: String?) -> ()) {
		router.request(.login(request: credentials)) { (data, response, error) in
			let returnRequest = self.getObject(data, response, error, Login.self)
			completion(returnRequest.0, returnRequest.1)
		}
	}
	
	func getUserBy(id: Int, completion: @escaping (_ user: User?, _ error: String?) -> ()) {
		router.request(.getUserBy(id: id)) { (data, response, error) in
			let returnRequest = self.getObject(data, response, error, User.self)
			completion(returnRequest.0, returnRequest.1)
		}
	}
	
	func getUserReviewsBy(userId: Int, completion: @escaping (_ review: Review?, _ error: String?) -> ()) {
		router.request(.getReviewsBy(userId: userId)) { (data, response, error) in
			let returnRequest = self.getObject(data, response, error, Review.self)
			completion(returnRequest.0, returnRequest.1)
		}
	}
}
