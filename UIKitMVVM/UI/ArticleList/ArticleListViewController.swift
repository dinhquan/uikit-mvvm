//
//  ArticleListViewController.swift
//  UIKitMVVM
//
//  Created by Quan on 25/07/2022.
//

import UIKit
import Combine
import CombineCocoa

final class ArticleListViewController: UIViewController {
    private typealias DataSource = UITableViewDiffableDataSource<Section, Article>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Article>
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!

    private var cancellables = Set<AnyCancellable>()
    private var dataSource: DataSource!

    var viewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configDataSource()
        bind()
        
        viewModel.fetchArticles()
    }
    
    private func bind() {
        viewModel.$articles.receive(on: RunLoop.main).sink { [weak self] articles in
            var snapshot = Snapshot()
            snapshot.appendSections([.articles])
            snapshot.appendItems(articles, toSection: .articles)
            self?.dataSource.apply(snapshot, animatingDifferences: true)
        }.store(in: &cancellables)
        
        viewModel.$isFetching.receive(on: RunLoop.main).sink { [weak self] isFetching in
            if isFetching {
                self?.indicatorView.isHidden = false
                self?.indicatorView.startAnimating()
            } else {
                self?.indicatorView.isHidden = true
                self?.indicatorView.stopAnimating()
            }
        }.store(in: &cancellables)
    }
}

private extension ArticleListViewController {
    enum Section {
        case articles
    }
    
    private func configDataSource() {
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, article in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
            cell.config(article)
            return cell
        }
    }
}
 
