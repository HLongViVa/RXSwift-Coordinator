//
//  ViewController.swift
//  RXSwift+Coordinator
//
//  Created by Hoang Long on 01/08/2023.
//

import UIKit

class ViewController: UIViewController, BindableType {
    @IBOutlet weak var  btnStart: UIButton!
    
    var viewModel: FirstViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func bindViewModel() {
        let input = FirstViewModel.Input(startTrigger: btnStart.rx.tap.asDriver())
        let _ = viewModel.transform(input: input)
    }
}

