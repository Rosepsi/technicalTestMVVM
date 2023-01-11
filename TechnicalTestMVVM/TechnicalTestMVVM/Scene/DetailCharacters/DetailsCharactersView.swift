//
//  DetailsCharactersView.swift
//  TechnicalTestMVVM
//
//  Created by Rosa Herrero on 10/1/23.
//

import UIKit
import AlamofireImage

class DetailsCharactersView: UIViewController {
    
    @IBOutlet weak var nameCharacter : UILabel!
    @IBOutlet weak var imageCharacter : UIImageView!
    @IBOutlet weak var descriptionCharacter : UITextView!
    
    var characterId : Int? 
    var detailViewModel: DetailsCharactersViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel = DetailsCharactersViewModel()
        detailViewModel?.completionDetail = { resultDetail in
            guard let result = resultDetail.first else {
                return
            }
            self.updateView(character: result)
        }
        guard let id = characterId else {
            return
        }
        detailViewModel?.getDetailCharacters(id: id)
        
    }
    
    func updateView (character : Character) {
        nameCharacter.text = character.name
        descriptionCharacter.text = character.descriptionCharacter
        guard let detail = character.thumbnail else {
            return
        }
        let url = String ("\(detail.path).\(detail.imageExtension)")
        guard let imageURL = URL (string: url) else {
            return
        }
        imageCharacter.af.setImage(withURL: imageURL)
    }
}
