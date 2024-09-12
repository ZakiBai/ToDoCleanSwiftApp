//
//  TaskRepository.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import Foundation

protocol ITaskRepository {
    func getTasks() -> [Task]
}

final class TaskRepositoryStub: ITaskRepository {
    func getTasks() -> [Task] {
        [
        ImportantTask(title: "Do homework", taskPriority: .high),
        RegularTask(title: "Clean room", completed: true),
        ImportantTask(title: "Write new tasks", taskPriority: .low),
        RegularTask(title: "Read book"),
        ImportantTask(title: "Walk with dog", taskPriority: .medium)
        ]
    }
}
