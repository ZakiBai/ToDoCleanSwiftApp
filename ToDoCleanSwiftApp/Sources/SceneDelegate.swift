//
//  SceneDelegate.swift
//  ToDoCleanSwiftApp
//
//  Created by Zaki Menzhanov on 10.09.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
//    private let taskManager = TaskManager()
    private var orderedTaskManager: OrderedTaskManager!
    private var appCoordinator: ICoordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        let navigationController = UINavigationController()
        
        let repository = TaskRepositoryStub()
        orderedTaskManager = OrderedTaskManager(taskManager: TaskManager())
        orderedTaskManager.addTasks(tasks: repository.getTasks())
        
        appCoordinator = AppCoordinator(
            navigationController: navigationController,
            taskManager: orderedTaskManager
        )
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        if let urlContext = connectionOptions.urlContexts.first {
            handleDeepLink(url: urlContext.url)
        } else {
            appCoordinator.start()
        }
        
        self.window = window
    }
    
    func handleDeepLink(url: URL) {
        
    }
}

