//
//  LoginPresenter.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import Foundation

protocol ILoginPresenter {
    func present(response: LoginModel.Response)
}

final class LoginPresenter: ILoginPresenter {
    
    // MARK: - Dependencies
    
    private weak var viewController: LoginViewController!
    
    // MARK: - Initialozation
    
    init(viewController: LoginViewController!) {
        self.viewController = viewController
    }
    
    // MARK: - Public methods
    
    func present(response: LoginModel.Response) {
        let viewModel: LoginModel.ViewModel
        switch response.success {
        case .success:
            viewModel = .success
        case .failure(let error):
            viewModel = .failure(error.localizedDescription)
        }
        viewController.render(viewModel: viewModel)
    }
}
