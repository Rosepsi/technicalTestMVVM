//
//  ListOfCharacersViewModel.swift
//  TechnicalTestMVVM
//
//  Created by Rosa Herrero on 10/1/23.
//

import UIKit

class ListOfCharacersViewModel {
    
    var completionList : ((Characters) -> Void)?
    let networkWorker : NetworkManager
    init(networkWorker: NetworkManager = NetworkWorker.shared) {
        self.networkWorker = networkWorker
    }
    
    func getCharacters () {
        networkWorker.getCharacterList { listCharacter in
            self.completionList? (listCharacter)
        }
    }
}
