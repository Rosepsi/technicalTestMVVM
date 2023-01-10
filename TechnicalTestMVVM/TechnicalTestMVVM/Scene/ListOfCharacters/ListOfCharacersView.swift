//
//  ListOfCharacersView.swift
//  TechnicalTestMVVM
//
//  Created by Rosa Herrero on 10/1/23.
//


import UIKit

class ListOfCharactersView: UIViewController {
    
    @IBOutlet weak var listCharacters : UITableView!
    var characters : Characters = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCharacters.delegate = self
        listCharacters.dataSource = self
        listCharacters.register(UINib (nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "reusableListCell")
    }
}

extension ListOfCharactersView : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableListCell") as! ListCell
        let listCharacter = characters [indexPath.row]
        cell.nameCharacterList.text = listCharacter.name
        return cell
    }
}

