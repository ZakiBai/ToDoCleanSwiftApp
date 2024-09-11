//
//  LoginRouter.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import UIKit

protocol ILoginRouter {
    func routeToNext()
    func showError(message: String)
}

final class LoginRouter: ILoginRouter {
    
    // MARK: - Dependencies
    
    private let navigationController: UINavigationController
    private let nextViewController: UIViewController
    
    // MARK: - Initialiaztion
    
    init(navigationController: UINavigationController, nextViewController: UIViewController) {
        self.navigationController = navigationController
        self.nextViewController = nextViewController
    }
    
    // MARK: - Public methods
    
    func routeToNext() {
        navigationController.pushViewController(nextViewController, animated: true)
    }
    
    func showError(message: String) {
        let alert: UIAlertController
        alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default)
        alert.addAction(action)
        navigationController.present(alert, animated: true)
    }
}
