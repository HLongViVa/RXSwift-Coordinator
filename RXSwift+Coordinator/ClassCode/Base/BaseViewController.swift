//
//  BaseViewController.swift
//  RXSwift+Coordinator
//
//  Created by Hoang Long on 01/08/2023.
//

import UIKit
import RxSwift
import JGProgressHUD

class BaseViewController: UIViewController {

    var hud = JGProgressHUD(style: .dark)
    let bag = DisposeBag()
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.hideKeyboardWhenTappedAround()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(backNavigation))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
    }
    
    @objc func backNavigation() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func showLoading() {
        self.hud.show(in: self.view)
    }
    
    func dismissLoading() {
        self.hud.dismiss()
    }
}
