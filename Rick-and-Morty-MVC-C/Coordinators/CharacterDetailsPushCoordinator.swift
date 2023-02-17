//
//  CharacterDetailsPushCoordinator.swift
//  Rick-and-Morty-MVC-C
//
//  Created by Edwin Cardenas on 2/16/23.
//

import UIKit

class CharacterDetailsPushCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var characterModel: CharacterModel
    
    init(navigationController: UINavigationController?, characterModel: CharacterModel) {
        self.navigationController = navigationController
        self.characterModel = characterModel
    }
    
    func start() {
        let characterDetailsViewController = CharacterDetailViewController(characterDetailsModel: characterModel)
        
        navigationController?.pushViewController(characterDetailsViewController, animated: true)
    }
}
