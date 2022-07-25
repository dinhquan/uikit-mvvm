//
//  ViewController.swift
//  UIKitMVVM
//
//  Created by Quan on 25/07/2022.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let articleNavigator = ArticleNavigator()
        articleNavigator.showArticleList(from: self)
    }
}

