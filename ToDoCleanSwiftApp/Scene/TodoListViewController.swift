//
//  TodoListViewController.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 10.09.2024.
//

import UIKit

final class TodoListViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Actions
private extension TodoListViewController {
    @objc func addTapped() {
        print("add button tapped")
    }
}

// MARK: - UI Setup

private extension TodoListViewController {
    func setupUI() {
        title = "ToDoList"
        self.tableView.register(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: "cell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped)
        )
    }
}
