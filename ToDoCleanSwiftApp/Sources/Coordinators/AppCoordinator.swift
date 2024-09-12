//
//  AppCoordinator.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 12.09.2024.
//

import UIKit

final class AppCoordinator: ICoordinator {
    var childCoordinators: [ICoordinator] = []
    
    var finishDelegate: ICoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    private var taskManager: ITaskManager
    
    init(navigationController: UINavigationController, taskManager: ITaskManager) {
        self.navigationController = navigationController
        self.taskManager = taskManager
    }
    
    func start() {
        showLoginFlow()
    }
    
    func showLoginFlow() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.finishDelegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    func showTodoListFlow() {
        let coordinator = TodoListCoordinator(navigationController: navigationController, taskManager: taskManager)
        coordinator.finishDelegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

extension AppCoordinator: ICoordinatorFinishDelegate {
    func didFinish(coordinator: ICoordinator) {
        if coordinator is ILoginCoordinator {
            showTodoListFlow()
        }
    }
}
