//
//  CreateTaskInteractor.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import Foundation

protocol ICreateTaskInteractor {
    func createTask(request: CreateTaskModel.Request)
}

final class CreateTaskInteractor: ICreateTaskInteractor {
    
    // MARK: - Dependencies
    
    private var presenter: ICreateTaskPresenter
    private let taskManager: ITaskManager
    private let createTaskClosure: () -> Void
    
    // MARK: - Initialization
    
    init(presenter: ICreateTaskPresenter, taskManager: ITaskManager, createTaskClosure: @escaping () -> Void) {
        self.presenter = presenter
        self.taskManager = taskManager
        self.createTaskClosure = createTaskClosure
    }
    
    // MARK: - Public methods
    
    func createTask(request: CreateTaskModel.Request) {
        switch request {
        case .regular(let title):
            let task = RegularTask(title: title)
            taskManager.addTask(task: task)
        case .important(let task):
            let task = ImportantTask(
                title: task.title,
                taskPriority: ImportantTask.TaskPriority(rawValue: task.priority) ?? .high
            )
            taskManager.addTask(task: task)
        }
        createTaskClosure()
    }
}
