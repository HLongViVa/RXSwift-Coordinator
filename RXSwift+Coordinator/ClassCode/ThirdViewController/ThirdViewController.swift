//
//  ThirdViewController.swift
//  RXSwift+Coordinator
//
//  Created by Hoang Long on 02/08/2023.
//

import UIKit

class ThirdViewController: BaseViewController, BindableType {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnBack: UIButton!

    var viewModel: ThirdViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        let input = ThirdViewModel.Input(backTrigger: btnBack.rx.tap.asDriver())
        
        let output = viewModel.transform(input: input)
        
        output.titleSubject
            .do(onNext: {[weak self] (text, isPresented) in
                if let strongSelf = self {
                    strongSelf.lblTitle.text = text
                    if isPresented == true {
                        strongSelf.lblTitle.textColor = .black
                        strongSelf.btnBack.setTitle("Back from present", for: .normal)
                    } else {
                        strongSelf.lblTitle.textColor = .red
                        strongSelf.btnBack.setTitle("Back from push", for: .normal)
                    }
                }
            })
            .drive()
            .disposed(by: bag)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
