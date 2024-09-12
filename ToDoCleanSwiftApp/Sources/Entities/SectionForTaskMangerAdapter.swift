//
//  SectionForTaskMangerAdapter.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 11.09.2024.
//

protocol ISectionForTaskManagerAdapter {
    func getSections() -> [Section]
    func getSection(forIndex index: Int) -> Section
    func getTasksForSection(section: Section) -> [Task]
}

enum Section {
    case completed
    case uncompleted
    case allTasks
    case important
    case regular
    
    var title: String {
        switch self {
        case .completed:
            return "Completed"
        case .uncompleted:
            return "Uncompleted"
        case .allTasks:
            return "All"
        case .important:
            return "Important"
        case .regular:
            return "Regular"
        }
    }
}

final class SectionForTaskMangerAdapter: ISectionForTaskManagerAdapter {
    
    private let taskManager: ITaskManager
    
    private let sections: [Section]
    
    init(taskManager: ITaskManager, sections: [Section] = [.uncompleted, .completed]) {
        self.taskManager = taskManager
        self.sections = sections
    }
    
    func getSections() -> [Section] {
        sections
    }
    
    func getSection(forIndex index: Int) -> Section {
        let correctedIndex = min(index, sections.count - 1)
        return sections[correctedIndex]
    }
    
    func getTasksForSection(section: Section) -> [Task] {
        switch section {
        case .completed:
            return taskManager.completedTasks()
        case .uncompleted:
            return taskManager.uncompletedTasks()
        case .allTasks:
            return taskManager.allTasks()
        case .important:
            return taskManager.allTasks().filter { $0 is ImportantTask }
        case .regular:
            return taskManager.allTasks().filter { $0 is RegularTask }
        }
    }
}
