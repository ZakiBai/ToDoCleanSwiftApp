//
//  LoginPresenter.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import Foundation

typealias LoginResultClosure = (Result<Void, LoginError>) -> Void

protocol ILoginPresenter {
    func present(response: LoginModel.Response)
}

final class LoginPresenter: ILoginPresenter {
    
    // MARK: - Dependencies
    
    private weak var viewController: LoginViewController?
    var loginResultClosure: LoginResultClosure?
    
    // MARK: - Initialozation
    
    init(viewController: LoginViewController?, loginResultClosure: LoginResultClosure?) {
        self.viewController = viewController
        self.loginResultClosure = loginResultClosure
    }
    
    // MARK: - Public methods
    
    func present(response: LoginModel.Response) {
        loginResultClosure?(response.success)
    }
}
