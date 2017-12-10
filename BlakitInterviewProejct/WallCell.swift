//
//  WallCell.swift
//  BlakitInterviewProejct
//
//  Created by VironIT Developer on 12/8/17.
//  Copyright © 2017 VironIT Developer. All rights reserved.
//

import UIKit
import Kingfisher

class WallCell: UITableViewCell {

    @IBOutlet weak var postAuthorImageView: UIImageView!
    @IBOutlet weak var postAuthorName: UILabel!
    @IBOutlet weak var postAuthorDate: UILabel!
    @IBOutlet weak var postAuthorInfo: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var repostButton: UIButton!
    @IBOutlet weak var postMadeFromDeviceTypeImageView: UIImageView!
    @IBOutlet weak var postAttachedImageView: UIImageView!
    @IBOutlet weak var attachmentsStackView: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()

        postAuthorImageView.layer.cornerRadius = postAuthorImageView.frame.height / 2
        postAuthorImageView.clipsToBounds = true
    }

    override func removeFromSuperview() {
        for view in attachmentsStackView.arrangedSubviews {
            if let imageView = view as? ImageView {
                imageView.image = nil
            }
        }
    }
}

extension WallCell {
    func confiureCell(with wallPost: PostModel) {
        postAuthorInfo.text = wallPost.text
        likeButton.setTitle("💙 Likes " + String(wallPost.likes_count), for: .normal)
        commentButton.setTitle("💬 Comments " + String(wallPost.comments_count), for: .normal)
        repostButton.setTitle("📢 " + String(wallPost.reposts_count), for: .normal)
        switch wallPost.platform {
        case "android"?:
            postMadeFromDeviceTypeImageView.image = UIImage(named: "android")
        case "iphone"?:
            postMadeFromDeviceTypeImageView.image = UIImage(named: "apple")
        default: break
        }
        if let postAttachmentPhotoUrl = wallPost.attachment_photo_scrBig {
            postAttachedImageView.kf.setImage(with: URL(string: postAttachmentPhotoUrl))
        }
        if wallPost.attachment_photo_scrBig == nil {
            postAttachedImageView.image = nil
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss dd.MM.yyyy"
        let postDate = dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(wallPost.date)))
        postAuthorDate.text = postDate
        ApiManager.WallPostsRequest.getUserInfo(userID: String(wallPost.fromID)) { success, userInfoObj in
            if success {
                self.postAuthorImageView.kf.setImage(with: URL(string: (userInfoObj?.photoURl)!))
                self.postAuthorName.text = (userInfoObj?.firstName)! + " " + (userInfoObj?.lastName)!
            }
        }
    }
}
