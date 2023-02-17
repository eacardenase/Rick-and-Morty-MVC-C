//
//  MainCoordinator.swift
//  Rick-and-Morty-MVC-C
//
//  Created by Edwin Cardenas on 2/16/23.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let listOfCharactersViewController = storyboard.instantiateViewController(withIdentifier: "CharacterListViewController")
        
        navigationController?.pushViewController(listOfCharactersViewController, animated: true)
        
    }
}
