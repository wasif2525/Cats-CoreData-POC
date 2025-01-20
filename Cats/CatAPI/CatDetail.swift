//
//  CatDetail.swift
//  Cats
//
//  Created by Bhuiyan Wasif on 10/25/23.
//

import Foundation

// MARK: - CatDetail
struct CatDetail: Codable, Identifiable {
    var id: String?
    var url: String?
    var height: Int?
    var width: Int?
    var breeds: [CatListItem]?
}
