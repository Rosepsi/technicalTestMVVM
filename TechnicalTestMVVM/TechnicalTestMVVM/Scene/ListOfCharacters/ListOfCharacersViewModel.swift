//
//  ListOfCharacersViewModel.swift
//  TechnicalTestMVVM
//
//  Created by Rosa Herrero on 10/1/23.
//

import UIKit

class ListOfCharacersViewModel {
    
    var completionList : ((Characters) -> Void)?
    
    func getCharacters () {
        NetworkManager.shared.getCharacterList { listCharacter in
            self.completionList? (listCharacter)
        }
    }
}
