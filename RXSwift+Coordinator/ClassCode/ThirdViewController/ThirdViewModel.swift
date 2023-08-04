//
//  ThirdViewModel.swift
//  RXSwift+Coordinator
//
//  Created by Hoang Long on 02/08/2023.
//

import Foundation
import XCoordinator
import RxSwift
import RxCocoa

final class ThirdViewModel: ViewModelProtocol {
    private let router: UnownedRouter<SecondRoute>
    private let bag = DisposeBag()
    
    private let title: String
    private let isPresented: Bool
    
    init(router: UnownedRouter<SecondRoute>, title: String, isPresented: Bool) {
        self.router = router
        self.title = title
        self.isPresented = isPresented
    }
    
    func transform(input: Input) -> Output {
        input.backTrigger
            .do(onNext: {[weak self] in
                if let strongSelf = self {
                    if strongSelf.isPresented == true {
                        strongSelf.router.trigger(.dismiss)
                    } else {
                        strongSelf.router.trigger(.goBack)
                    }
                }
            })
            .drive()
            .disposed(by: bag)
        
        return Output(titleSubject: Driver<(String, Bool)>.just((title, isPresented)))
    }
}

extension ThirdViewModel {
    struct Input {
        let backTrigger: Driver<Void>
    }
    
    struct Output {
        let titleSubject: Driver<(String, Bool)>
    }
}
