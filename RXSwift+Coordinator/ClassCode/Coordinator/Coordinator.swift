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
    case pushThird(String)
    case presentThird(String)
    case goBack
    case dismiss
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
            case .pushThird(let title):
                let thirdViewController = ThirdViewController.init(nibName: "ThirdViewController", bundle: Bundle(for: ThirdViewController.self))
                let thirdViewModel = ThirdViewModel(router: unownedRouter, title: title, isPresented: false)
                thirdViewController.bind(to: thirdViewModel)
                return .push(thirdViewController)
            case .presentThird(let title):
                let thirdViewController = ThirdViewController.init(nibName: "ThirdViewController", bundle: Bundle(for: ThirdViewController.self))
                let thirdViewModel = ThirdViewModel(router: unownedRouter, title: title, isPresented: true)
                thirdViewController.bind(to: thirdViewModel)
                return .present(thirdViewController)
            case .goBack:
                return .pop()
            case .dismiss:
                return .dismiss()
        }
    }
}
