//
//  CharacterListView.swift
//  Rick-and-Morty-MVC-C
//
//  Created by Edwin Cardenas on 2/16/23.
//

import UIKit

class CharacterListView: UIView {
    let charactersTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register( CharacterListCellView.self, forCellReuseIdentifier: "CharacterListCellView")
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(charactersTableView)
        
        NSLayoutConstraint.activate([
            charactersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            charactersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            charactersTableView.topAnchor.constraint(equalTo: topAnchor),
            charactersTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
