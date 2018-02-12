//
//  PostListTableViewCell.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/31/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

protocol ConfigurableCellWithModel {
    associatedtype CellModel
    
    func configure(with model: CellModel?)
}

class PostListTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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

extension PostListTableViewCell : ConfigurableCellWithModel {
    
    func configure(with model: Post?) {
        postTitleLabel.text = model?.title
        postTextView.text = model?.textToPresent
    }
}
