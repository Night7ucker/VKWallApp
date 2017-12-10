//
//  WallPostsRequest.swift
//  BlakitInterviewProejct
//
//  Created by VironIT Developer on 11/20/17.
//  Copyright © 2017 VironIT Developer. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxRealm
import RealmSwift

extension ApiManager {

    class WallPostsRequest {
        
        static func getWallPosts(userID: String) {

            let provider = MoyaProvider<VKApi>()
            provider.rx.request(.wall(userID: userID))
                .subscribe { event in
                    switch event {
                    case let .success(response):
                        do {
                            let data = try response.mapJSON()
                            if let json = data as? [String: Any] {
                                if let wallPosts = json.first?.value as? NSArray {
                                    for post in wallPosts {
                                        if let postData = post as? [String: Any] {
                                            guard let wallPost = PostModel(JSON: postData) else { return }
                                            if let attachments = postData["attachments"] as? [[String: Any]] {
                                                for attachment in attachments {
                                                    if let type = attachment["type"] as! String? {
                                                        if type == "photo" {
                                                            let photoAttachment = PhotoAttachment(JSON: attachment)
                                                            wallPost.photoAttachments.append(photoAttachment!)
                                                        }
                                                    }
                                                }
                                            }
                                            let realm = try! Realm()
                                            Observable.from(optional: wallPost)
                                                .subscribe(realm.rx.add())
                                        }
                                    }
                                }
                            }
                        } catch {
                            print("Error during mapping WallPosts objects.")
                        }
                    case let .error(error):
                        print(error)
                    }
            }
        }

        static func getUserInfo(userID: String, completion: @escaping (Bool, UserInfo?) -> Void) {
            let provider = MoyaProvider<VKApi>()
            provider.rx.request(.user(userID: userID))
                .subscribe { event in
                    switch event {
                    case let .success(response):
                        do {
                            let data = try response.mapJSON()
                            if let json = data as? [String: Any] {
                                if let wallPosts = json.first?.value as? NSArray {
                                    for post in wallPosts {
                                        if let postData = post as? [String: Any] {
                                            let userModel = UserInfo(JSON: postData)
                                            completion(true, userModel)
                                            return
                                        }
                                    }
                                }
                            }

                        } catch {
                            print("error during getting user info")
                            completion(false, nil)
                        }
                    case .error(_):
                        print("some error accured")
                        completion(false, nil)
                    }
            }
        }

        static func getVideo(ownerID: String, videoID: String, completion: @escaping (Bool) -> Void) {
            let provider = MoyaProvider<VKApi>()
            provider.rx.request(.video(ownerID: ownerID, videoID: videoID))
                .subscribe { event in
                    switch event {
                    case let .success(response):
                        do {
                            let data = try! response.mapJSON()
                            if let json = data as? [String: Any] {
                                print(json)
                                completion(true)
                            }
                        }
                    case .error(_):
                        print("some error accured")
                        completion(false)
                    }
            }
        }
    }

    
}
