//
//  SecondViewModel.swift
//  RXSwift+Coordinator
//
//  Created by Hoang Long on 01/08/2023.
//

import Foundation
import XCoordinator
import RxSwift

final class SecondViewModel: ViewModelProtocol {
    private let router: UnownedRouter<SecondRoute>
    private let bag = DisposeBag()
    
    init(router: UnownedRouter<SecondRoute>) {
        self.router = router
    }
    
    func transform(input: Input) -> Output {
        
        
        return Output()
    }
}

extension SecondViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
}
