//
//  ListOfCharactersTableViewDelegate.swift
//  Rick-and-Morty-MVC-C
//
//  Created by Edwin Cardenas on 2/16/23.
//

import UIKit

class ListOfCharactersTableViewDelegate: NSObject, UITableViewDelegate {
    var didTapOnCell: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
