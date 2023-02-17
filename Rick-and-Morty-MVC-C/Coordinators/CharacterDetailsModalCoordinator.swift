//
//  CharacterDetailsModalCoordinator.swift
//  Rick-and-Morty-MVC-C
//
//  Created by Edwin Cardenas on 2/16/23.
//

import UIKit

class CharacterDetailsModalCoordinator: Coordinator {
    var viewController: UIViewController?
    var characterModel: CharacterModel
    
    init(viewController: UIViewController?, characterModel: CharacterModel) {
        self.viewController = viewController
        self.characterModel = characterModel
    }
    
    func start() {
        let characterDetailViewController = CharacterDetailViewController(characterDetailsModel: characterModel)
        
        viewController?.present(characterDetailViewController, animated: true)
    }
}
