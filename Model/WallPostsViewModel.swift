//
//  WallPostsViewModel.swift
//  BlakitInterviewProejct
//
//  Created by VironIT Developer on 11/20/17.
//  Copyright © 2017 VironIT Developer. All rights reserved.
//

import Foundation
import RxRealm
import RxSwift
import RealmSwift

class WallPostsViewModel {
    private let bag = DisposeBag()

    private(set) var posts: Observable<(AnyRealmCollection<PostModel>, RealmChangeset?)>!

    init(userID: String) {
        if userID != "" {
            ApiManager.WallPostsRequest.getWallPosts(userID: userID)
        } else {
            ApiManager.WallPostsRequest.getWallPosts(userID: "1")
        }

        bindOutput()
    }

    private func bindOutput() {
        guard let realm = try? Realm() else { return }
        posts = Observable.changeset(from: realm.objects(PostModel.self))
    }
}
