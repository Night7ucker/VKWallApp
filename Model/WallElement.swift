//
//  WallElement.swift
//  BlakitInterviewProejct
//
//  Created by VironIT Developer on 11/19/17.
//  Copyright © 2017 VironIT Developer. All rights reserved.
//

import Foundation
import ObjectMapper
import Realm
import RealmSwift

class UserInfo: Object, Mappable {
    @objc dynamic var photoURl: String?
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?

    required convenience init?(map: Map) { self.init() }

    func mapping(map: Map) {

        photoURl <- map["photo_50"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]

    }
}

class PostModel: Object, Mappable {

    @objc dynamic var platform: String?
    @objc dynamic var type: String?
    @objc dynamic var id = 0
    @objc dynamic var fromID = 0
    @objc dynamic var likes_canLike = 0
    @objc dynamic var likes_canPublish = 0
    @objc dynamic var likes_count = 0
    @objc dynamic var likes_userLikes = 0
    @objc dynamic var postType = 0
    @objc dynamic var text: String?
    @objc dynamic var comments_canPost = 0
    @objc dynamic var comments_count = 0
    @objc dynamic var comments_groupsCanPost = 0
    @objc dynamic var date = 0
    @objc dynamic var replyCount = 0
    @objc dynamic var online = 0
    @objc dynamic var reposts_count = 0
    @objc dynamic var reposts_userReposted = 0
    @objc dynamic var toID = 0
    @objc dynamic var itemID = 0
    @objc dynamic var ownerID = 0
    @objc dynamic var thumbSrc: String?
    @objc dynamic var media_type: String?
    @objc dynamic var attachments_photo_accessKey: String?
    @objc dynamic var attachments_photo_aid = 0
    @objc dynamic var attachments_photo_created = 0
    @objc dynamic var attachments_photo_height = 0
    @objc dynamic var attachments_photo_ownerID = 0
    @objc dynamic var attachments_photo_pid = 0
    @objc dynamic var attachments_photo_src: String?
    @objc dynamic var attachments_photo_scrBig: String?
    @objc dynamic var attachments_photo_srcSmall: String?
    @objc dynamic var attachments_photo_srcXBig: String?
    @objc dynamic var attachments_photo_text: String?
    @objc dynamic var attachments_photo_width: String?
    @objc dynamic var attachments_type: String?
    @objc dynamic var attachment_photo_accessKey: String?
    @objc dynamic var attachment_photo_aid = 0
    @objc dynamic var attachment_photo_created = 0
    @objc dynamic var attachment_photo_height = 0
    @objc dynamic var attachment_photo_ownerID = 0
    @objc dynamic var attachment_photo_pid = 0
    @objc dynamic var attachment_photo_postID = 0
    @objc dynamic var attachment_photo_src: String?
    @objc dynamic var attachment_photo_scrBig: String?
    @objc dynamic var attachment_photo_srcSmall: String?
    @objc dynamic var attachment_photo_srcXBig: String?
    @objc dynamic var attachment_photo_text: String?
    @objc dynamic var attachment_photo_userID: String?
    @objc dynamic var attachment_photo_width: String?
    @objc dynamic var attachment_type: String?
    @objc dynamic var notCopyPostID = 0
    @objc dynamic var userInfo: UserInfo?
    let photoAttachments = List<PhotoAttachment>()

    required convenience init?(map: Map) { self.init() }

    func mapping(map: Map) {
        platform <- map["post_source.platform"]
        type <- map["post_source.type"]
        id <- map["id"]
        fromID <- map["from_id"]
        likes_canLike <- map["likes.can_like"]
        likes_canPublish <- map["likes.can_publish"]
        likes_count <- map["likes.count"]
        likes_userLikes <- map["likes.user_likes"]
        postType <- map["post_type"]
        text <- map["text"]
        comments_canPost <- map["comments.can_post"]
        comments_count <- map["comments.count"]
        comments_groupsCanPost <- map["comments.groups_can_post"]
        date <- map["date"]
        replyCount <- map["reply_count"]
        online <- map["online"]
        reposts_count <- map["reposts.count"]
        reposts_userReposted <- map["reposts.user_reposted"]
        toID <- map["to_id"]
        itemID <- map["item_id"]
        ownerID <- map["owner_id"]
        thumbSrc <- map["thumb_src"]
        media_type <- map["media.type"]
        // make array for attachments
        attachment_photo_accessKey <- map["attachment.photo.access_key"]
        attachment_photo_aid <- map["attachment.photo.aid"]
        attachment_photo_created <- map["attachment.photo.created"]
        attachment_photo_height <- map["attachment.photo.height"]
        attachment_photo_ownerID <- map["attachment.photo.owner_id"]
        attachment_photo_pid <- map["attachment.photo.pid"]
        attachment_photo_postID <- map["attachment.photo.post_id"]
        attachment_photo_src <- map["attachment.photo.src"]
        attachment_photo_scrBig <- map["attachment.photo.src_big"]
        attachment_photo_srcSmall <- map["attachment.photo.src_small"]
        attachment_photo_text <- map["attachment.photo.text"]
        attachment_photo_userID <- map["attachment.photo.user_id"]
        attachment_photo_width <- map["attachment.photo.width"]
        attachment_type <- map["attachment.type"]
        notCopyPostID <- map["copy_post_id"]
    }
}

class PhotoAttachment: Object, Mappable {
    @objc dynamic var photo_access_key: String?
    @objc dynamic var photo_aid = 0
    @objc dynamic var photo_created = 0
    @objc dynamic var photo_height = 0
    @objc dynamic var photo_ownerID = 0
    @objc dynamic var photo_pid = 0
    @objc dynamic var photo_src: String?
    @objc dynamic var photo_src_big: String?
    @objc dynamic var photo_src_small: String?
    @objc dynamic var photo_text: String?
    @objc dynamic var photo_user_id = 0
    @objc dynamic var photo_width = 0
    @objc dynamic var type: String?

    required convenience init?(map: Map) { self.init() }

    func mapping(map: Map) {
        photo_access_key <- map["photo.access_key"]
        photo_aid <- map["photo.aid"]
        photo_created <- map["photo.created"]
        photo_height <- map["photo.created"]
        photo_ownerID <- map["photo.owner_id"]
        photo_pid <- map["photo.pid"]
        photo_src <- map["photo.src"]
        photo_src_big <- map["photo.src_big"]
        photo_src_small <- map["photo.src_small"]
        photo_text <- map["photo.text"]
        photo_user_id <- map["photo.user_id"]
        photo_width <- map["photo.width"]
        type <- map["type"]
    }
}

class UserIDModel: Object {
    @objc var userID: String?
}








