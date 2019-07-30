//
//  NetworkError.swift
//  Bookr
//
//  Created by Jeffrey Santana on 7/29/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

enum NetworkError: String, Error {
	case parametersNil	= "Parameters were nil."
	case encodingFailed	= "Parmaeter encoding failed."
	case missingURL		= "URL is nil."
}
