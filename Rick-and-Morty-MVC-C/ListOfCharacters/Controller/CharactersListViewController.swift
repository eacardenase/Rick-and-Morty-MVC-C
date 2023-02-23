//
//  CharactersListViewController.swift
//  Rick-and-Morty-MVC-C
//
//  Created by Edwin Cardenas on 2/16/23.
//

import UIKit

class CharactersListViewController: UIViewController {
    var apiClient = ListOfCharactersAPIClient()
    private var tableViewDataSource: ListOfCharactersTableViewDataSource?
    private var tableViewDelegate: ListOfCharactersTableViewDelegate?
    var characterDetailsPushCoordinator: CharacterDetailsPushCoordinator?
    var characterDetailsModalCoordinator: CharacterDetailsModalCoordinator?
    var characterListView = CharacterListView()
    var currentCoordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Push"
        
        setup()
        
        Task {
            let characters = await apiClient.getListOfCharacters()
            tableViewDataSource?.set(characters: characters.results)
        }
    }
}

extension CharactersListViewController {
    
    private func setup() {
        view = characterListView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Change", style: .plain, target: self, action: #selector(changeTapped))
        
        tableViewDataSource = ListOfCharactersTableViewDataSource(tableView: characterListView.charactersTableView)
        characterListView.charactersTableView.dataSource = tableViewDataSource
        characterListView.charactersTableView.delegate = self
    }
    
    @objc func changeTapped() {
        let ac = UIAlertController(title: "Change Coordinator", message: nil, preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "Push", style: .default, handler: changeTitleCoordinator))
        ac.addAction(UIAlertAction(title: "Modal", style: .default, handler: changeTitleCoordinator))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
    
    func changeTitleCoordinator(action: UIAlertAction) {
        DispatchQueue.main.async {
            self.title = action.title!
        }
    }
}

extension CharactersListViewController: ListOfCharactersTableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell(index: indexPath.row)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func didTapOnCell(index: Int) {
        // Present New Controller
        guard let dataSource = tableViewDataSource, let currentTitle = title else { return }
        
        let characterModel = dataSource.characters[index]
        
        switch currentTitle {
        case "Modal":
            currentCoordinator = CharacterDetailsModalCoordinator(viewController: self, characterModel: characterModel)
        case "Push":
            currentCoordinator = CharacterDetailsPushCoordinator(navigationController: self.navigationController, characterModel: characterModel)
        default:
            fatalError("Coordinator not supported")
        }
        
        currentCoordinator?.start()
    }
}
