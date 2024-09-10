//
//  OrderedTaskManager.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 10.09.2024.
//

import Foundation

final class OrderedTaskManager: ITaskManager {
    private let taskManager: TaskManager
    
    init(taskManager: TaskManager) {
        self.taskManager = taskManager
    }
    
    func allTasks() -> [Task] {
        sort(tasks: taskManager.allTasks())
    }
    
    func completedTasks() -> [Task] {
        sort(tasks: taskManager.completedTasks())
    }
    
    func uncompletedTasks() -> [Task] {
        sort(tasks: taskManager.uncompletedTasks())
    }
    
    func addTask(task: Task) {
        taskManager.addTask(task: task)
    }
    
    func addTasks(tasks: [Task]) {
        taskManager.addTasks(tasks: tasks)
    }
    
    func removeTask(task: Task) {
        taskManager.removeTask(task: task)
    }
}

private extension OrderedTaskManager {
    func sort(tasks: [Task]) -> [Task] {
        tasks.sorted {
            if let task0 = $0 as? ImportantTask, let task1 = $1 as? ImportantTask {
                return task0.taskPriority.rawValue > task1.taskPriority.rawValue
            }
            if $0 is ImportantTask, $1 is RegularTask {
                return true
            }
            return false
        }
    }
}
