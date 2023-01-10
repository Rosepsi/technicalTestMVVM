//
//  DetailCharactersModel.swift
//  TechnicalTestMVVM
//
//  Created by Rosa Herrero on 10/1/23.
//

import Foundation

public struct CharacterDataWrapperDetail: Codable {
    let code: Int?
    let data: DetailCharacterDataContainer?
}

public struct DetailCharacterDataContainer: Codable {
    let results: CharactersDetail?
}

struct CharacterDetail: Codable {
    let id: Int?
    let name, description: String?
    let thumbnail: Image?

    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail
        case description = "description"
    }
}

typealias CharactersDetail = [CharacterDetail]
