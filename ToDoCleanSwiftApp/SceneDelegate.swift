//
//  SceneDelegate.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 10.09.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let taskManager = TaskManager()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        let navigationController = UINavigationController()
        navigationController.pushViewController(assembly(navigationController: navigationController), animated: false)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func assembly(navigationController: UINavigationController) -> UIViewController {
        let loginViewController = LoginAssembler().assembly()
        let repository = TaskRepositoryStub()
        let todoListViewController = TodoListAssembler(repository: repository, taskManager: taskManager).assembly()
        let loginRouter = LoginRouter(
            navigationController: navigationController,
            nextViewController: todoListViewController
        )
        loginViewController.router = loginRouter
        
        let todoListRouter = TodoListRouter(
            taskManager: taskManager,
            navigationController: navigationController
        )
        
        todoListViewController.router = todoListRouter
        
        return loginViewController
    }
}

