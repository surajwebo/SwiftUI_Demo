//
//  ArticleViewModel.swift
//  Articles
//
//  Created by Suraj on 29/07/20.
//  Copyright © 2020 Suraj. All rights reserved.
//

import Foundation
import Combine

class ArticleViewModel: ObservableObject {
    private var articleService: ArticleService!
    
    @Published var article: [Article] = [Article]()
    
    init() {
        self.articleService = ArticleService()
    }
    
    var pageNo: String = ""
    func getArticles() {
        if let pageNo = self.pageNo.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchArticles(by: pageNo)
        }
    }
    
    private func fetchArticles(by pageNo: String) {
        self.articleService.getArticles(pageNo: pageNo) { article in
            if let article = article {
                DispatchQueue.main.async {
                    self.article = article
                }
            }
        }
    }
}
