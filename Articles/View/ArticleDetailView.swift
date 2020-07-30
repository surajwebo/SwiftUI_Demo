//
//  ArticleWebView.swift
//  Articles
//
//  Created by Suraj on 29/07/20.
//  Copyright © 2020 Suraj. All rights reserved.
//

import SwiftUI

struct ArticleDetailView: View {
    var article = Article()
    var body: some View {
        getArticleImage()
    }
    
    func getArticleImage() -> AnyView {
        if article.media!.count > 0, let articleImage = article.media?[0].image {
            return AnyView (
                RemoteImageView(urlString: articleImage, defaultImageString: "ArticleMedia")
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    .overlay(RoundedRectangle(cornerRadius: 2)
                        .stroke(Color.green, lineWidth: 2))
                    .shadow(radius: 10)
            ) 
        }
        return AnyView (Image("ArticleMedia"))
    }
}

struct ArticleWebView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: Article())
    }
}
