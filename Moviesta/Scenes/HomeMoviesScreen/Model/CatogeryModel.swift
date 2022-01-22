//
//  CatogeryModel.swift
//  Moviesta
//
//  Created by SODA on 22/01/2022.
//

import Foundation

// MARK: - CatogeryModel
struct CatogeryModel: Codable {
    var genres: [Genre]?
}

// MARK: - Genre
struct Genre: Codable {
    var id: Int?
    var name: String?
}
