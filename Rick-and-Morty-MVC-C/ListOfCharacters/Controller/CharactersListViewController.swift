//
//  CharactersListViewController.swift
//  Rick-and-Morty-MVC-C
//
//  Created by Edwin Cardenas on 2/16/23.
//

import UIKit

class CharactersListViewController: UIViewController {
    var mainView: CharacterListView {
        self.view as! CharacterListView
    }
    var apiClient = ListOfCharactersAPIClient()
    private var tableViewDataSource: ListOfCharactersTableViewDataSource?
    private var tableViewDelegate: ListOfCharactersTableViewDelegate?
    var characterDetailsPushCoordinator: CharacterDetailsPushCoordinator?

    override func loadView() {
        view = CharacterListView()
        tableViewDelegate = ListOfCharactersTableViewDelegate()
        
        tableViewDataSource = ListOfCharactersTableViewDataSource(tableView: mainView.charactersTableView)
        mainView.charactersTableView.dataSource = tableViewDataSource
        mainView.charactersTableView.delegate = tableViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            
            // Present New Controller
            guard let dataSource = self?.tableViewDataSource else { return }
            
            let characterModel = dataSource.characters[index]
            self?.characterDetailsPushCoordinator = CharacterDetailsPushCoordinator(navigationController: self?.navigationController, characterModel: characterModel)
            
            self?.characterDetailsPushCoordinator?.start()
            
        }
        
        Task {
            let characters = await apiClient.getListOfCharacters()
            tableViewDataSource?.set(characters: characters.results)
        }
    }
}

