//
//  CreateTaskPresenter.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import Foundation

protocol ICreateTaskPresenter {
    func taskCreated()
}

final class CreateTaskPresenter: ICreateTaskPresenter {
    
    // MARK: - Dependencies
    
    private weak var viewController: ICreateTaskViewController!
    
    // MARK: - Initialization
    
    init(viewController: ICreateTaskViewController!) {
        self.viewController = viewController
    }
    
    // MARK: - Public methods
    func taskCreated() {
        viewController.taskCreated()
    }
}
