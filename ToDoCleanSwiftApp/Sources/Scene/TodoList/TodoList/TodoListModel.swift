//
//  TodoListModel.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

import Foundation

enum TodoListModel {
    enum Request {
        struct TaskSelected {
            let indexPath: IndexPath
        }
    }
    
    struct Response {
        let data: [SectionWithTasks]
        
        struct SectionWithTasks {
            let section: Section
            let tasks: [Task]
        }
    }
    
    struct ViewModel {
        let tasksBySections: [Section]
        
        struct Section {
            let title: String
            let tasks: [Task]
        }
        
        enum Task {
            case regularTask(RegularTask)
            case importantTask(ImportantTask)
        }
        
        struct RegularTask {
            let title: String
            let completed: Bool
        }
        
        struct ImportantTask {
            let title: String
            let completed: Bool
            let deadline: String
            let priority: String
        }
    }
}
