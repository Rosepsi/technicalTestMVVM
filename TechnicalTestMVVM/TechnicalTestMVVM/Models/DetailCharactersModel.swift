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
    let results: Characters?
}

