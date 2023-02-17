//
//  ListOfCharactersTableViewDataSource.swift
//  Rick-and-Morty-MVC-C
//
//  Created by Edwin Cardenas on 2/16/23.
//

import UIKit

final class ListOfCharactersTableViewDataSource: NSObject, UITableViewDataSource {
    private let tableView: UITableView
    
    private(set) var characters: [CharacterModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, characters: [CharacterModel] = []) {
        self.tableView = tableView
        self.characters = characters
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterListCellView", for: indexPath) as? CharacterListCellView
            else { fatalError("Could not downcast UITableViewCell to CharacterListCellView") }
        
        let character = characters[indexPath.row]
        cell.configure(character)
        
        return cell
    }
    
    func set(characters: [CharacterModel]) {
        self.characters = characters
    }
}
