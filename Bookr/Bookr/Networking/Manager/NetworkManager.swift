//
//  NetworkManager.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/29/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

enum NetworkResponse: String {
	case success
	case authenticationError = "You need to be authenticated first."
	case badRequest = "Bad request"
	case outdated = "The url you requested is outdated."
	case failed = "Network request failed."
	case noData = "Response returned with no data to decode."
	case unableToDecode = "We could no decode the response."
}

enum Result<String> {
	case success
	case failure(String)
}

struct NetworkManager {
	let token: String?
	private let router = Router<BookrRouter>()
	
	private func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
		switch response.statusCode {
		case 200...299: return .success
		case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
		case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
		case 600: return .failure(NetworkResponse.outdated.rawValue)
		default: return .failure(NetworkResponse.failed.rawValue)
		}
	}
	
//	func login(user: User, completion: @escaping (_ login: Login?, _ error: String?) -> ()) {
//		router.request(.login) { (data, response, error) in
//			if error != nil {
//				completion(nil, "Please check your network connection.")
//			}
//
//			if let response = response as? HTTPURLResponse {
//				let result = self.handleNetworkResponse(response)
//				switch result {
//				case .success:
//					guard let responseData = data else {
//						completion(nil, NetworkResponse.noData.rawValue)
//						return
//					}
//
//					do {
//						let decoder = JSONDecoder()
//						decoder.keyDecodingStrategy = .convertFromSnakeCase
//						let apiResponse = try decoder.decode(Login.self, from: responseData)
//						completion(apiResponse, nil)
//					} catch {
//						completion(nil, NetworkResponse.unableToDecode.rawValue)
//					}
//				case .failure(let networkFailureError):
//					completion(nil, networkFailureError)
//				}
//			}
//		}
//	}
	
	func login(credentials: LoginRequest, completion: @escaping (_ login: Login?, _ error: String?) -> ()) {
		router.request(.login(request: credentials)) { (data, response, error) in
			if error != nil {
				completion(nil, "Please check your network connection.")
			}
			
			if let response = response as? HTTPURLResponse {
				let result = self.handleNetworkResponse(response)
				switch result {
				case .success:
					guard let responseData = data else {
						completion(nil, NetworkResponse.noData.rawValue)
						return
					}
					
					do {
						let decoder = JSONDecoder()
						decoder.keyDecodingStrategy = .convertFromSnakeCase
						let apiResponse = try decoder.decode(Login.self, from: responseData)
						completion(apiResponse, nil)
					} catch {
						completion(nil, NetworkResponse.unableToDecode.rawValue)
					}
				case .failure(let networkFailureError):
					completion(nil, networkFailureError)
				}
			}
		}
	}
}
