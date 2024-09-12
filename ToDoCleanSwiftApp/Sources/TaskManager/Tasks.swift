//
//  Tasks.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 10.09.2024.
//

import Foundation

public class Task {
     var title: String
     var completed = false
    
     init(title: String, completed: Bool = false) {
        self.title = title
        self.completed = completed
    }
}

final class RegularTask: Task { }

final class ImportantTask: Task {
    private let createDate: Date
    var taskPriority: TaskPriority
    
    enum TaskPriority: Int, CustomStringConvertible {
        case low
        case medium
        case high
        
        var description: String {
            switch self {
            case .low:
                "!"
            case .medium:
                "!!"
            case .high:
                "!!!"
            }
        }
    }
    
    var deadline: Date {
        switch taskPriority {
        case .low:
            return Calendar.current.date(byAdding: .day, value: 3, to: createDate)!
        case .medium:
            return Calendar.current.date(byAdding: .day, value: 2, to: createDate)!
        case .high:
            return Calendar.current.date(byAdding: .day, value: 1, to: createDate)!
        }
    }
    
    init(title: String, createDate: Date = Date(), taskPriority: TaskPriority) {
        self.createDate = createDate
        self.taskPriority = taskPriority
        super.init(title: title)
    }
    
}


