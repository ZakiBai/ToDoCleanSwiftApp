//
//  CreateTaskModel.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import Foundation

enum CreateTaskModel {
    enum Request {
        case regular(String)
        case important(ImportantTask)
        
        struct ImportantTask {
            let title: String
            let priority: Int
        }
    }
}
