//
//  CatEndpoint.swift
//  Cats
//
//  Created by Bhuiyan Wasif on 10/25/23.
//

import Foundation

enum CatEndpoint {
    case catList
    case catDetail(String)
}

extension CatEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .catList:
            guard let url = URL(string: "https://api.thecatapi.com/v1/breeds")
                else {preconditionFailure("Invalid URL format")}
            var request = URLRequest(url: url)
            request.setValue("f492d6e0-73cd-49d3-8c4f-cef8ceb1b321", forHTTPHeaderField: "x-api-key")
            
            return request
        case .catDetail(let catId):
            let urlComponents = NSURLComponents(string: "https://api.thecatapi.com/v1/images/search")!
            urlComponents.queryItems = [
                URLQueryItem(name: "breed_id", value: catId)
            ]
            guard let url = urlComponents.url
                else {preconditionFailure("Invalid URL format")}
            
            var request = URLRequest(url: url)
            request.setValue("f492d6e0-73cd-49d3-8c4f-cef8ceb1b321", forHTTPHeaderField: "x-api-key")
            
            return request
        }
    }
}
