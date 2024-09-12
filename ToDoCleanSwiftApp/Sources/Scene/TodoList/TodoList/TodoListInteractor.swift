//
//  TodoListInteractor.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import Foundation

protocol ITodoListInteractor {
    func fetchData()
    func didTaskSelected(request: TodoListModel.Request.TaskSelected)
    func createTask()
}

final class TodoListInteractor: ITodoListInteractor {
    
    // MARK: - Dependencies
    
    private var presenter: ITodoListPresenter
    private var sectionManager: ISectionForTaskManagerAdapter
    private var createTaskClosure: () -> Void
    
    // MARK: - Initiazlization
    
    init(presenter: ITodoListPresenter, sectionManager: ISectionForTaskManagerAdapter, createTaskClosure: @escaping () -> Void) {
        self.presenter = presenter
        self.sectionManager = sectionManager
        self.createTaskClosure = createTaskClosure
    }
    
    // MARK: - Public methods
    
    func fetchData() {
        var responseData = [TodoListModel.Response.SectionWithTasks]()
        
        for section in sectionManager.getSections() {
            let sectionWithTasks = TodoListModel.Response.SectionWithTasks(
                section: section,
                tasks: sectionManager.getTasksForSection(section: section)
            )
            responseData.append(sectionWithTasks)
        }
        
        let response = TodoListModel.Response(data: responseData)
        presenter.present(response: response)
    }
    
    func didTaskSelected(request: TodoListModel.Request.TaskSelected) {
        let section = sectionManager.getSection(forIndex: request.indexPath.section)
        let task = sectionManager.getTasksForSection(section: section)[request.indexPath.row]
        task.completed.toggle()
        fetchData()
    }
    
    func createTask() {
        createTaskClosure()
    }
    
}
