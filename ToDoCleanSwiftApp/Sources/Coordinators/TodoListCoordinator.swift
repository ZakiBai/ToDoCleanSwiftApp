//
//  TodoListCoordinator.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 12.09.2024.
//

import UIKit

protocol ITodoListCoordinator: ICoordinator {
    func showCreateTaskScene()
    func showTodoListScene()
}

final class TodoListCoordinator: ITodoListCoordinator {
    
    var childCoordinators: [ICoordinator] = []
    var finishDelegate: ICoordinatorFinishDelegate?
    var navigationController: UINavigationController
    private var taskManager: ITaskManager
    
    init(navigationController: UINavigationController, taskManager: ITaskManager) {
        self.navigationController = navigationController
        self.taskManager = taskManager
    }
    
    func start() {
        showTodoListScene()
    }
    
    func showCreateTaskScene() {
        let viewController = CreateTaskAssembler(taskManager: taskManager).assembly { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showTodoListScene() {
        let viewController = TodoListAssembler(taskManager: taskManager).assembly { [weak self] in
            self?.showCreateTaskScene()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
