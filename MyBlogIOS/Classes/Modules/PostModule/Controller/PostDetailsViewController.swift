//
//  PostDetailsViewController.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/30/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class PostDetailsViewController: UIViewController {

    fileprivate var output: PostDetailsOutput?
    var postToShow: Post?
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureOutputAndInput()
        fillTexts()
    }
}

extension PostDetailsViewController {
    func configureOutputAndInput() {
        output = PostDetailsInteractor()
    }
    
    func fillTexts() {
        self.title = postToShow?.title ?? "Post" // maybe limit title to some count of symbols, because post titles can be lengthy
        postTitleLabel.text = postToShow?.title ?? nil
        postTextView.text = postToShow?.text ?? nil
    }
}
