//
//  ITaskManager.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 10.09.2024.
//

protocol ITaskManager {
    func allTasks() -> [Task]
    func completedTasks() -> [Task]
    func uncompletedTasks() -> [Task]
    func addTask(task: Task)
    func addTasks(tasks: [Task])
    func removeTask(task: Task)
}
