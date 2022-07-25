//
//  ArticleListViewModel.swift
//  UIKitMVVM
//
//  Created by Quan on 25/07/2022.
//

import Foundation

final class ArticleListViewModel {
    @Injected var articleService: ArticleService

    @Published private(set) var articles: [Article] = []
    @Published private(set) var isFetching = false

    func fetchArticles() {
        Task {
            isFetching = true
            articles = try await articleService.searchArticlesByKeyword("Tesla", page: 1)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isFetching = false
            }
        }
    }
}
