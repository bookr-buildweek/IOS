//
//  NetworkRouter.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/29/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

protocol NetworkRouter: class {
	associatedtype EndPoint: EndPointType
	func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
	func cancel()
}
