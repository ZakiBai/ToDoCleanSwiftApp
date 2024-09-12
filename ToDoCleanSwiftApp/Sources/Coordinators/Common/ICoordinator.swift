//
//  ICoordinator.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 12.09.2024.
//

import UIKit

public protocol ICoordinator: AnyObject {
    var childCoordinators: [ICoordinator] { get set }
    var finishDelegate: ICoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func finish()
}

public extension ICoordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.didFinish(coordinator: self)
    }
}
