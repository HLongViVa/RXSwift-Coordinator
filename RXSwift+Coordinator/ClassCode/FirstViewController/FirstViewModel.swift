//
//  FirstViewModel.swift
//  RXSwift+Coordinator
//
//  Created by Hoang Long on 01/08/2023.
//

import Foundation
import XCoordinator
import RxSwift
import RxCocoa

class FirstViewModel: ViewModelProtocol {
    private let router: UnownedRouter<AppRoute>
    private let bag = DisposeBag()
    
    
    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }
    
    func transform(input: FirstViewModel.Input) -> FirstViewModel.Output {
        input.startTrigger
            .do(onNext: {[weak self] in
                if let strongSelf = self {
                    
                }
            })
            .drive()
            .disposed(by: bag)
                
        return Output()
    }
}

extension FirstViewModel {
    struct Input {
        let startTrigger: Driver<Void>
    }
    
    struct Output {
        
    }
}
