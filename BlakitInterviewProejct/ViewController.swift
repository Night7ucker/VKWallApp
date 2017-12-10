//
//  ViewController.swift
//  BlakitInterviewProejct
//
//  Created by VironIT Developer on 11/18/17.
//  Copyright © 2017 VironIT Developer. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxCocoa
import RealmSwift
import RxRealm
import VK_ios_sdk
import RxRealmDataSources

class ViewController: UIViewController {

    @IBOutlet weak var tableViewUserWall: UITableView!

    let bag = DisposeBag()

    var users: Results<UserInfo>? = nil

    var viewModel: WallPostsViewModel?

    var userID: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = WallPostsViewModel(userID: userID!)

        tableViewUserWall.rowHeight = UITableViewAutomaticDimension
        tableViewUserWall.estimatedRowHeight = 250

        bindUI()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    func bindUI() {
        viewModel?.posts
            .subscribe(onNext: { [weak self] _ in self?.tableViewUserWall.reloadData() })
            .disposed(by: bag)

        let dataSource = RxTableViewRealmDataSource<PostModel>(cellIdentifier: "WallCell", cellType: WallCell.self) { cell, _, wallPost in
            cell.confiureCell(with: wallPost)
        }

        viewModel?.posts
            .subscribeOn(MainScheduler.instance)
            .bind(to: tableViewUserWall.rx.realmChanges(dataSource))
            .disposed(by: bag)
    }
}

