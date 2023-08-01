//
//  Coordinator.swift
//  RXSwift+Coordinator
//
//  Created by Hoang Long on 01/08/2023.
//

import Foundation
import XCoordinator

enum SecondRoute: Route {
    case second
}

class SecondCoordinator: NavigationCoordinator<SecondRoute> {
    
    init() {
        super.init(initialRoute: .second)
        self.rootViewController.setNavigationBarHidden(true, animated: false)
        self.rootViewController.modalPresentationStyle = .fullScreen
    }
    
    init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController, initialRoute: nil)
    }

    init(router: SecondRoute) {
        super.init(initialRoute: router)
    }
    
    deinit {
        print("deinit Coordinator")
    }
    
    override func prepareTransition(for route: SecondRoute) -> NavigationTransition {
        switch route {
            case .second:
                let secondViewController = SecondViewController.init(nibName: "SecondViewController", bundle: Bundle(for: SecondViewController.self))
                let secondViewModel = SecondViewModel(router: unownedRouter)
                secondViewController.bind(to: secondViewModel)
                return .push(secondViewController)
        }
    }
}
