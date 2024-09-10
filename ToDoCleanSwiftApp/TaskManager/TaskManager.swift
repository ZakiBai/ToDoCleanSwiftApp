//
//  TaskManager.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 10.09.2024.
//

final class TaskManager: ITaskManager {
    private var taskList: [Task] = []
    
    init(taskList: [Task]) {
        self.taskList = taskList
    }
    
    func allTasks() -> [Task] {
        taskList
    }
    
    func completedTasks() -> [Task] {
        taskList.filter { $0.completed }
    }
    
    func uncompletedTasks() -> [Task] {
        taskList.filter { !$0.completed }
    }
    
    func addTask(task: Task) {
        taskList.append(task)
    }
    
    func addTasks(tasks: [Task]) {
        taskList.append(contentsOf: tasks)
    }
    
    func removeTask(task: Task) {
        taskList.removeAll { $0 === task }
    }
}
