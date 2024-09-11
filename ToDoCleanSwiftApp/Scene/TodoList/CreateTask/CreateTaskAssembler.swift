//
//  CreateTaskAssembler.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import Foundation

final class CreateTaskAssembler {
    // MARK: - Dependencies
    
    private let taskManager: ITaskManager
    
    // MARK: - Initialization
    
    init(taskManager: ITaskManager) {
        self.taskManager = taskManager
    }
    
    // MARK: - Public methods
    
    func assembly() -> CreateTaskViewController {
        let viewController = CreateTaskViewController()
        let presenter = CreateTaskPresenter(viewController: viewController)
        let interactor = CreateTaskInteractor(presenter: presenter, taskManager: taskManager)
        viewController.interactor = interactor
        return viewController
    }
}
