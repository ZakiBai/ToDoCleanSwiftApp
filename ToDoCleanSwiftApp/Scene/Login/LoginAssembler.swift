//
//  LoginAssembler.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import UIKit

final class LoginAssembler {
    func assembly() -> LoginViewController {
        let viewController = LoginViewController()
        let presenter = LoginPresenter(viewController: viewController)
        let worker = LoginWorker()
        let interactor = LoginInteractor(presenter: presenter, worker: worker)
        viewController.interactor = interactor
        return viewController
    }
}
