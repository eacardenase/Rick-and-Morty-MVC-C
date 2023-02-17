//
//  CharacterDetailViewController.swift
//  Rick-and-Morty-MVC-C
//
//  Created by Edwin Cardenas on 2/16/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    var mainView: CharacterDetailsView {
        self.view as! CharacterDetailsView
    }
    
    init(characterDetailsModel: CharacterModel) {
        super.init(nibName: nil, bundle: nil)
        
        mainView.configure(characterDetailsModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = CharacterDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
