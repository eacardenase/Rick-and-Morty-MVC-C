//
//  Coordinator.swift
//  Rick-and-Morty-MVC-C
//
//  Created by Edwin Cardenas on 2/16/23.
//

import UIKit

protocol Coordinator {
    var viewController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    
    func start()
}

extension Coordinator {
    var viewController: UIViewController? { nil }
    var navigationController: UINavigationController? { nil }
}
