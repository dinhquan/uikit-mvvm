//
//  ArticleTableViewCell.swift
//  UIKitMVVM
//
//  Created by Quan on 25/07/2022.
//

import UIKit

final class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    func config(_ article: Article) {
        titleLabel.text = article.title
    }
}
