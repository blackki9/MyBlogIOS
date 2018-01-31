//
//  PostListTableViewCell.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/31/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class PostListTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostTitle(title: String?) {
        postTitleLabel.text = title
    }
    
    func setPostText(text: String?) {
        postTextView.text = text
    }
}
