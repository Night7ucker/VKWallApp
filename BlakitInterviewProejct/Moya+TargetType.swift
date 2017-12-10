//
//  Moya+TargetType.swift
//  BlakitInterviewProejct
//
//  Created by VironIT Developer on 11/19/17.
//  Copyright © 2017 VironIT Developer. All rights reserved.
//

import Foundation
import Moya

enum VKApi {
    case wall(userID: String)
    case user(userID: String)
    case video(ownerID: String, videoID: String)
}

// MARK: - TargetType Protocol Implementation
extension VKApi: TargetType {
    var baseURL: URL { return URL(string: "https://api.vk.com/method")! }
    var path: String {
        switch self {
        case .wall:
            return "/wall.get"
        case .user:
            return "/users.get"
        case .video:
            return "/video.get"
        }
    }
    var method: Moya.Method {
        switch self {
        case .wall:
            return .get
        case .user:
            return .get
        case .video:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .wall(let userID):
            return .requestParameters(parameters: ["access_token": "03ab5a1203ab5a1203ab5a124903f4cfdb003ab03ab5a1259bb476aa5c8c4bb385ee8b9", "owner_id": userID, "domain": "id" + userID, "offset": "0", "count": "50", "filter": "all", "extended": "0"], encoding: URLEncoding.queryString)
        case .user(let userID):
            return .requestParameters(parameters: ["user_ids": userID, "fields": "photo_50"], encoding: URLEncoding.queryString)
        case .video(let ownerID, let videoID):
            return .requestParameters(parameters: ["owner_id": ownerID, "videoID": ownerID + "_" + videoID], encoding: URLEncoding.queryString)
        }
    }
    var sampleData: Data {
        switch self {
        default:
            return "dont know what this is doing".utf8Encoded
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

enum FetchImage {
    case fetchImage(url:String)
}

extension FetchImage: TargetType {
    var baseURL: URL {
        switch self {
        case .fetchImage(let url):
            return URL(string: url)!
        }
    }

    var path: String {
        switch self {
        default:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchImage:
            return .get
        }
    }

    var sampleData: Data {
        return "".utf8Encoded
    }

    var task: Task {
        switch self {
        case .fetchImage:
            return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        return ["Content-Type": "image/jpeg"]
    }


}

//public enum ImageFetcher {
//    case getImage(baseURL: String)
//}
//
//extension ImageFetcher: TargetType {
//    public var baseURL: URL {
//        switch self {
//        case .getImage(baseURL: let baseURL):
//            return URL(string: baseURL)!
//        }
//    }
//
//    public var path: String {
//        switch self {
//        case .getImage(baseURL: _):
//            return ""
//        }
//    }
//
//    public var method: Moya.Method {
//        switch self {
//        case .getImage(baseURL: _):
//            return .get
//        }
//    }
//
//    public var sampleData: Data {
//        switch self {
//        default:
//            return "default image".utf8Encoded
//        }
//    }
//
//    public var task: Task {
//        switch self {
//        case .getImage:
//            return .getImage(DownloadType.request(DownloadDestination))
//        }
//    }
//
//    public var headers: [String : String]? {
//        switch self {
//        case .getImage:
//            return nil
//        }
//    }
//
//    private let DefaultDownload
//
//
//}
//
//private extension String {
//    var urlEscapedString: String {
//        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
//    }
//
//    var utf8EncodedData: Data {
//        return self.data(using: .utf8)!
//    }
//}
//
//
//
//






