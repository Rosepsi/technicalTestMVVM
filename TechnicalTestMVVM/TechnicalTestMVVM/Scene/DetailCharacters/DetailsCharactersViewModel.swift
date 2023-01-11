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
    
    func getDetailCharacters (id : Int) {
        
        NetworkManager.shared.getCharacterDetail(id: id, completion: { detailCharacter in
            
            self.completionDetail? (detailCharacter)
        }) 
    }
}
