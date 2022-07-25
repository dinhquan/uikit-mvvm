//
//  ArticleNavigator.swift
//  UIKitMVVM
//
//  Created by Quan on 25/07/2022.
//

import Foundation
import UIKit

struct ArticleNavigator {
    func showArticleList(from controller: UIViewController) {
        let articleListViewController = UIStoryboard(name: "Article", bundle: nil).instantiateInitialViewController() as! ArticleListViewController
        let viewModel = ArticleListViewModel()
        articleListViewController.viewModel = viewModel
        
        let navigationController = UINavigationController(rootViewController: articleListViewController)
        navigationController.modalPresentationStyle = .fullScreen
        controller.present(navigationController, animated: false)
    }
}
