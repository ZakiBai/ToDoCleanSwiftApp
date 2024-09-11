//
//  TodoListViewController.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 10.09.2024.
//

import UIKit

protocol ITodoListViewController: AnyObject {
    func render(viewModel: TodoListModel.ViewModel)
    func createTask()
}

final class TodoListViewController: UITableViewController {
    
    // MARK: - Dependencies
    var router: ITodoListRouter?
    var interactor: ITodoListInteractor?
    
    // MARK: - Private protperties
    
    private var viewModel = TodoListModel.ViewModel(tasksBySections: [])
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchData()
    }
}

// MARK: - Actions
private extension TodoListViewController {
    @objc func addTapped() {
        interactor?.createTask()
    }
}

// MARK: - UITableView
extension TodoListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.tasksBySections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.tasksBySections[section].title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewModel.tasksBySections[section]
        return section.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = getTaskForIndex(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        configureCell(cell, with: task)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.didTaskSelected(request: TodoListModel.Request.TaskSelected(indexPath: indexPath))
    }
}

// MARK: - UI Setup

private extension TodoListViewController {
    func setupUI() {
        title = "ToDoList"
        navigationItem.setHidesBackButton(true, animated: true)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped)
        )
    }
    
    func getTaskForIndex(_ indexPath: IndexPath) -> TodoListModel.ViewModel.Task {
        let tasks = viewModel.tasksBySections[indexPath.section].tasks
        let task = tasks[indexPath.row]
        return task
    }
    
    func configureCell(_ cell: UITableViewCell, with task: TodoListModel.ViewModel.Task) {
        var contentConfiguration = cell.defaultContentConfiguration()
        cell.tintColor = .red
        cell.selectionStyle = .none
        
        switch task {
        case .regularTask(let regularTask):
            contentConfiguration.text = regularTask.title
            cell.accessoryType = regularTask.completed ? .checkmark : .none
        case .importantTask(let importantTask):
            let redText = [NSAttributedString.Key.foregroundColor: UIColor.red]
            let taskText = NSMutableAttributedString(string: importantTask.priority + " ", attributes: redText)
            taskText.append(NSAttributedString(string: importantTask.title))
            
            contentConfiguration.attributedText = taskText
            contentConfiguration.secondaryText = importantTask.deadline
            cell.accessoryType = importantTask.completed ? .checkmark : .none
        }
        
        cell.contentConfiguration = contentConfiguration
    }
}

// MARK: - ITodoListViewController

extension TodoListViewController: ITodoListViewController {
    func render(viewModel: TodoListModel.ViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
    func createTask() {
        router?.routeToCreateTask()
    }
}
