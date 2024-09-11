//
//  LoginModel.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import Foundation

enum LoginModel {
    struct Request {
        var login: String
        var password: String
    }
    
    struct Response {
        var success: Result<Void, LoginError>
    }
    
    enum ViewModel {
        case success
        case failure(String)
    }
    
}
