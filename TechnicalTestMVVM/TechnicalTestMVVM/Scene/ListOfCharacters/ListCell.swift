//
//  DetailsCell.swift
//  TechnicalTestMVVM
//
//  Created by Rosa Herrero on 10/1/23.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var nameCharacterList : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        nameCharacterList.font = UIFont.systemFont(ofSize: 18)
    }
    
}
