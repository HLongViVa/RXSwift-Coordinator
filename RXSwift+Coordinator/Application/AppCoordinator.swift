//
//  AppCoordinator.swift
//  RXSwift+Coordinator
//
//  Created by Hoang Long on 01/08/2023.
//

import Foundation
import XCoordinator

enum AppRoute: Route{
    case splash
    case second
}
class AppCoordinator: NavigationCoordinator<AppRoute>{
    
    init(){
        super.init(initialRoute: .splash)
        self.rootViewController.setNavigationBarHidden(true, animated: false)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
            case .splash:
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let firstViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                let firstViewModel = FirstViewModel(router: unownedRouter)
                firstViewController.bind(to: firstViewModel)
                return .push(firstViewController)
            case .second:
                let secondCoordinator = SecondCoordinator()
                return .present(secondCoordinator)
        }
    }
}
