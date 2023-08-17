//
//  SecondViewController.swift
//  RXSwift+Coordinator
//
//  Created by Hoang Long on 01/08/2023.
//

import UIKit

class SecondViewController: BaseViewController, BindableType {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tfdInput: UITextField!
    @IBOutlet weak var btnShowText: UIButton!
    @IBOutlet weak var btnPushViewController: UIButton!
    @IBOutlet weak var btnPresentViewController: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnOpenCollectionViewDemo: UIButton!
    
    var viewModel: SecondViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func bindViewModel() {
        let input = SecondViewModel.Input(
            getTextInputTrigger: tfdInput.rx.text.orEmpty.asDriver(),
            showTextTrigger: btnShowText.rx.tap.asDriver(),
            presentViewControllerTrigger: btnPresentViewController.rx.tap.asDriver(),
            openCollectionViewTrigger: btnOpenCollectionViewDemo.rx.tap.asDriver(),
            pushViewControllerTrigger: btnPushViewController.rx.tap.asDriver(),
            backTrigger: btnBack.rx.tap.asDriver()
        )
        
        let output = viewModel.transform(input: input)
        
        output.textSubject
            .drive(self.lblTitle.rx.text)
            .disposed(by: bag)
        
        output.textInputSubject
            .drive(self.tfdInput.rx.text)
            .disposed(by: bag)
    }
}
