//
//  LoginWorker.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import Foundation

protocol ILoginWorker {
    func login(login: String, password: String) -> Result<Void, LoginError>
}

enum LoginError: Error {
    case wrongPassword
    case wrongLogin
    case errorAuth
    case emptyFields
    
    var errorDescription: String? {
        switch self {
        case .wrongPassword:
            return "Неверный пароль."
        case .wrongLogin:
            return "Неверный логин."
        case .emptyFields:
            return "Пустые поля логин или пароль."
        case .errorAuth:
            return "Неверный пароль и логин."
        }
    }
}

final class LoginWorker: ILoginWorker {
    
    // MARK: - Private proterties
    
    private let validLogin = "Admin"
    private let validPassword = "pass"
    
    // MARK: - Public methods
    
    func login(login: String, password: String) -> Result<Void, LoginError> {
        guard !login.isEmpty, !password.isEmpty else { return .failure(.emptyFields) }
        switch (login == validLogin, password == validPassword) {
        case (true, true):
            return .success(())
        case (false, true):
            return .failure(.wrongLogin)
        case (true, false):
            return .failure(.wrongPassword)
        case (false, false):
            return .failure(.errorAuth)
        }
    }
}

class StubLoginWorker: ILoginWorker {
    func login(login: String, password: String) -> Result<Void, LoginError> {
        .success(())
    }
}
