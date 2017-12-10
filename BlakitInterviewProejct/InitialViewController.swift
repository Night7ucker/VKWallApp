//
//  InitialViewController.swift
//  BlakitInterviewProejct
//
//  Created by VironIT Developer on 12/10/17.
//  Copyright © 2017 VironIT Developer. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa

class InitialViewController: UIViewController {

    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!

    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(Realm.Configuration.defaultConfiguration.fileURL ?? "")

        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }

        doneButton.rx.tap
            .subscribe(onNext: {
                let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "kViewController") as! ViewController
                viewController.userID = self.userIDTextField.text
                self.navigationController?.pushViewController(viewController, animated: true)
            })
            .disposed(by: bag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

}
