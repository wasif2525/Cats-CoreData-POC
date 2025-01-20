//
//  APIError.swift
//  Cats
//
//  Created by Bhuiyan Wasif on 10/25/23.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
