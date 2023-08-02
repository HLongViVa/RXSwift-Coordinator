//
//  SecondViewModel.swift
//  RXSwift+Coordinator
//
//  Created by Hoang Long on 01/08/2023.
//

import Foundation
import XCoordinator
import RxSwift
import RxCocoa

final class SecondViewModel: ViewModelProtocol {
    private let router: UnownedRouter<SecondRoute>
    private let bag = DisposeBag()
    
    init(router: UnownedRouter<SecondRoute>) {
        self.router = router
    }
    
    func transform(input: Input) -> Output {
        var title = ""
        let titleSubject = PublishSubject<String>()
        let resetTextInputSubject = PublishSubject<String>()
        
        input.getTextInputTrigger
            .asObservable()
            .subscribe(onNext: {[weak self] text in
                titleSubject.onNext(text)
            }, onError: {[weak self] error in
                print("onError \(error)")
            }, onCompleted: {
                print("onCompleted")
            })
            .disposed(by: bag)
        
        input.showTextTrigger
            .do(onNext: {[weak self] in
                titleSubject.onNext("Demo rxswift input output")
                resetTextInputSubject.onNext("")
            })
        .drive()
        .disposed(by: bag)
        
        input.pushViewControllerTrigger
            .do(onNext: {[weak self] in
                if let strongSelf = self {
                    strongSelf.router.trigger(.pushThird("Push from SecondViewController (Color red): \(title)"))
                }
            })
            .drive()
            .disposed(by: bag)
                
        input.presentViewControllerTrigger
            .do(onNext: {[weak self] in
                if let strongSelf = self {
                    strongSelf.router.trigger(.presentThird("Present from SecondViewController (Color black): \(title)"))
                }
            })
            .drive()
            .disposed(by: bag)
                
        input.backTrigger
            .do(onNext: {[weak self] in
                if let strongSelf = self {
                    strongSelf.router.trigger(.dismiss)
                }
            })
            .drive()
            .disposed(by: bag)
                
        
        return Output(textSubject: titleSubject.asDriver(onErrorJustReturn: ""), textInputSubject: resetTextInputSubject.asDriver(onErrorJustReturn: ""))
    }
}

extension SecondViewModel {
    struct Input {
        let getTextInputTrigger: Driver<String>
        let showTextTrigger: Driver<Void>
        let presentViewControllerTrigger: Driver<Void>
        let pushViewControllerTrigger: Driver<Void>
        let backTrigger: Driver<Void>
    }
    
    struct Output {
        let textSubject: Driver<String>
        let textInputSubject: Driver<String>
    }
}
