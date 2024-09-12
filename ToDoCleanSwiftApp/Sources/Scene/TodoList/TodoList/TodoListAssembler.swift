//
//  TodoListAssembler.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import UIKit

final class TodoListAssembler {
    
    // MARK: - Dependencies
    private let taskManager: ITaskManager
        
    // MARK: - Initialization
    
    init(taskManager: ITaskManager) {
        self.taskManager = taskManager
    }
    
    // MARK: - Public methods
    
    func assembly(createTaskClosure: @escaping () -> Void) -> TodoListViewController {
        let viewController = TodoListViewController()
        let sectionForTheManagerAdapter = SectionForTaskMangerAdapter(taskManager: taskManager)
        let presenter = TodoListPresenter(viewController: viewController)
        let interactor = TodoListInteractor(presenter: presenter, sectionManager: sectionForTheManagerAdapter, createTaskClosure: createTaskClosure)
        viewController.interactor = interactor
        return viewController
    }
}
