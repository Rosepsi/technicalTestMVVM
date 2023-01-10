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
    var listView: ListOfCharacersViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCharacters.delegate = self
        listCharacters.dataSource = self
        listCharacters.register(UINib (nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "reusableListCell")
        listView = ListOfCharacersViewModel()
        listView?.completionList = { resultList in
            self.characters = resultList
            self.listCharacters.reloadData()
        }
        listView?.getCharacters()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationNavigationController = segue.destination as? UINavigationController,
           let destination = destinationNavigationController.topViewController as? DetailsCharactersView,
           let indexPath = self.listCharacters.indexPathForSelectedRow {
            listCharacters.deselectRow(at: indexPath, animated: true)
            let characterSelect = characters [indexPath.row]
            destination.characterDetail = characterSelect
        }
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailCharacterSegue", sender: self)
    }
}

