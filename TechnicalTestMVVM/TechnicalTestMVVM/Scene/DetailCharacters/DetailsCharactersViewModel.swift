//
//  DetailsCharactersViewModel.swift
//  TechnicalTestMVVM
//
//  Created by Rosa Herrero on 10/1/23.
//

import UIKit
import Alamofire

class DetailsCharactersViewModel {
    
    var completionDetail : ((Characters) -> Void)?
    let networkWorker : NetworkManager
    init(networkWorker: NetworkManager = NetworkWorker.shared) {
        self.networkWorker = networkWorker
    }
    
    func getDetailCharacters (id : Int) {
        networkWorker.getCharacterDetail(id: id, completion: { detailCharacter in
            self.completionDetail? (detailCharacter)
        }) 
    }
}
