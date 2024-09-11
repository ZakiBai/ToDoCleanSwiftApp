//
//  TodoListRouter.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import UIKit

protocol ITodoListRouter: AnyObject {
    func routeToCreateTask()
    func backTodoList()
}

final class TodoListRouter: ITodoListRouter {
    
    // MARK: - Dependencies
    
    private let taskManager: ITaskManager
    private let navigationController: UINavigationController
    
    // MARK: - Initialization
    
    init(taskManager: ITaskManager, navigationController: UINavigationController) {
        self.taskManager = taskManager
        self.navigationController = navigationController
    }
    
    // MARK: - Public methods
    
    func routeToCreateTask() {
        let viewController = CreateTaskAssembler(taskManager: taskManager).assembly()
        navigationController.pushViewController(viewController, animated: true)
        viewController.router = self
    }
    
    func backTodoList() {
        navigationController.popViewController(animated: true)
    }
}
