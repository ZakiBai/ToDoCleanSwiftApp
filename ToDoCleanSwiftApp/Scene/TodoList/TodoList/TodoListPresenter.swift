//
//  TodoListPresenter.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import Foundation

protocol ITodoListPresenter {
    func present(response: TodoListModel.Response)
    func createTask()
}

final class TodoListPresenter: ITodoListPresenter {
    // MARK: - Dependencies
    
    private weak var viewController: ITodoListViewController!
    
    // MARK: - Initiazlization
    
    init(viewController: ITodoListViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Public methods
    
    func present(response: TodoListModel.Response) {
        var sections = [TodoListModel.ViewModel.Section]()
        for sectionWithTask in response.data {
            let sectionData = TodoListModel.ViewModel.Section(
                title: sectionWithTask.section.title,
                tasks: mapTaskData(tasks: sectionWithTask.tasks)
            )
            sections.append(sectionData)
        }
        viewController.render(viewModel: TodoListModel.ViewModel(tasksBySections: sections))
    }
    
    func createTask() {
        viewController.createTask()
    }
}

// MARK: - Private methods
private extension TodoListPresenter {
    func mapTaskData(tasks: [Task]) -> [TodoListModel.ViewModel.Task] {
        tasks.map { mapTaskData(task: $0) }
    }
    
    func mapTaskData(task: Task) -> TodoListModel.ViewModel.Task {
        if let task = task as? ImportantTask {
            let result = TodoListModel.ViewModel.ImportantTask(
                title: task.title,
                completed: task.completed,
                deadline: "Deadline: \(task.deadline)",
                priority: "\(task.taskPriority)"
            )
            return .importantTask(result)
        } else {
            return .regularTask(
                TodoListModel.ViewModel.RegularTask(
                    title: task.title,
                    completed: task.completed
                )
            )
        }
    }
}
