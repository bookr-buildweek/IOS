//
//  ReviewAPIManager.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/31/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

extension NetworkManager {
	func getAllReviewsBy(userId: Int, completion: @escaping (_ reviews: [Review]?, _ error: String?) -> ()) {
		router.request(.getReviewsBy(userId: userId)) { (data, response, error) in
			let returnRequest = self.getArray(data, response, error, Review.self)
			completion(returnRequest.0, returnRequest.1)
		}
	}
	
	func getReviewBy(reviewId: Int, completion: @escaping (_ reviews: Review?, _ error: String?) -> ()) {
		router.request(.getReviewBy(id: reviewId)) { (data, response, error) in
			let returnRequest = self.getObject(data, response, error, Review.self)
			completion(returnRequest.0, returnRequest.1)
		}
	}
	
	func editReview(reviewId: Int, data: ReviewRequest, completion: @escaping (_ reviews: Review?, _ error: String?) -> ()) {
		router.request(.putReviewBy(id: reviewId, request: data)) { (data, response, error) in
			let returnRequest = self.getObject(data, response, error, Review.self)
			completion(returnRequest.0, returnRequest.1)
		}
	}
	
	func deleteReview(reviewId: Int, completion: @escaping (_ reviews: Review?, _ error: String?) -> ()) {
		router.request(.deleteReviewBy(id: reviewId)) { (data, response, error) in
			let returnRequest = self.getObject(data, response, error, Review.self)
			completion(returnRequest.0, returnRequest.1)
		}
	}
}
