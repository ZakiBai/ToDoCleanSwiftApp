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
    
    func assembly(createTaskClosure: @escaping () -> Void) -> CreateTaskViewController {
        let viewController = CreateTaskViewController()
        let presenter = CreateTaskPresenter(viewController: viewController)
        let interactor = CreateTaskInteractor(presenter: presenter, taskManager: taskManager, createTaskClosure: createTaskClosure)
        viewController.interactor = interactor
        return viewController
    }
}
