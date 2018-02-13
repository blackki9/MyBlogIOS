//
//  PostListRouter.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 2/7/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class PostListRouter {
    
    fileprivate let viewControllerToShowOn: UIViewController
    
    init(viewController: UIViewController) {
        viewControllerToShowOn = viewController
    }
    
    func showPostDetails(post: Post?) {
        let storyboard = UIStoryboard(name: "Blog", bundle: nil)
        guard let postDetailsController = storyboard.instantiateInitialViewController() as? PostDetailsViewController else {
            return
        }
        postDetailsController.postToShow = post
        viewControllerToShowOn.navigationController?.pushViewController(postDetailsController, animated: true)
    }
    
    func showLogin() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        guard let postDetailsController = storyboard.instantiateInitialViewController() as? LoginViewController else {
            return
        }

        viewControllerToShowOn.navigationController?.pushViewController(postDetailsController, animated: true)
    }
}
