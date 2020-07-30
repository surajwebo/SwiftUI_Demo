//
//  Webservice.swift
//  Articles
//
//  Created by Suraj on 28/07/20.
//  Copyright © 2020 Suraj. All rights reserved.
//

import Foundation

class ArticleService {
    func getArticles(pageNo: String, completion: @escaping ([Article]?) -> ()) {
        guard let url = URL(string: "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/blogs?page=\(pageNo)&limit=10") else {
                completion(nil)
                return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([Article]?.self, from: data)
                if let articles: [Article] = articles, articles.count > 0 {
                    //print(articles)
                    completion(articles)
                } else {
                    completion(nil)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
