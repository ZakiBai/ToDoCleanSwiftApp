//
//  ICoordinatorFinishDelegate.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 12.09.2024.
//

import Foundation

public protocol ICoordinatorFinishDelegate: AnyObject {
    func didFinish(coordinator: ICoordinator)
}
