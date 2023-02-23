//
//  ListOfCharactersTableViewDelegate.swift
//  Rick-and-Morty-MVC-C
//
//  Created by Edwin Cardenas on 2/16/23.
//

import UIKit

protocol ListOfCharactersTableViewDelegate: NSObject, UITableViewDelegate {
    func didTapOnCell(index: Int) -> Void
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}
