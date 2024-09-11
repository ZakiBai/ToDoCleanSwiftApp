//
//  TodoListAssembler.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import UIKit

final class TodoListAssembler {
    
    // MARK: - Dependencies
    
    private let repository: ITaskRepository
    private let taskManager: ITaskManager
    
    
    // MARK: - Initialization
    
    init(repository: ITaskRepository, taskManager: ITaskManager) {
        self.repository = repository
        self.taskManager = taskManager
    }
    
    // MARK: - Public methods
    
    func assembly() -> TodoListViewController {
        let viewController = TodoListViewController()
        let taskManager = buildTaskManager()
        let sectionForTheManagerAdapter = SectionForTaskMangerAdapter(taskManager: taskManager)
        let presenter = TodoListPresenter(viewController: viewController)
        let interactor = TodoListInteractor(presenter: presenter, sectionManager: sectionForTheManagerAdapter)
        viewController.interactor = interactor
        return viewController
    }
    
    // MARK: - Private methods
    
    private func buildTaskManager() -> ITaskManager {
        let orderTaskManager = OrderedTaskManager(taskManager: taskManager)
        orderTaskManager.addTasks(tasks: repository.getTasks())
        return orderTaskManager
    }
}
