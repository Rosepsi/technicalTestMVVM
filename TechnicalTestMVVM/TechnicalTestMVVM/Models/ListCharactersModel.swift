//
//  ListCharactersModel.swift
//  TechnicalTestMVVM
//
//  Created by Rosa Herrero on 10/1/23.
//


import Foundation

public struct CharacterDataWrapper: Codable {
    let code: Int?
    let data: CharacterDataContainer?
} 

public struct CharacterDataContainer: Codable {
    let results: Characters?
}

public struct Character: Codable, Identifiable {
    public let id: Int?
    let name, descriptionCharacter: String?
    let thumbnail: Image?

    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail
        case descriptionCharacter = "description"
    }
}

public struct Image: Codable {
    let path: String
    let imageExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}

typealias Characters = [Character]
