//
//  ArticleCell.swift
//  Articles
//
//  Created by Suraj on 28/07/20.
//  Copyright © 2020 Suraj. All rights reserved.
//

import SwiftUI

struct ArticleCellView: View {
    var article = Article()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            HStack {
                getUserAvatar()
                VStack (alignment: .leading, spacing: 10) {
                    getUserName()
                    getUserDesignation()
                } .padding(.all)
            }
            getArticleImage()
            getContent()
            getArticleTitle()
            getArticleUrl()
            Divider()
            HStack (alignment: .center) {
                getLikesCount()
                Spacer()
                getCommentsCount()
            }
        } .padding()
        
    }
    
    func getContent() -> AnyView {
        if let content = article.content {
            return AnyView (
                Text(content)
                    .fontWeight(.medium)
                    .lineLimit(nil)
            )
        }
        return AnyView(EmptyView())
    }
    
    func getUserName() -> AnyView {
        if let userName = article.user?[0].name, let lastName = article.user?[0].lastname {
            return AnyView (
                Text(userName + " " + lastName)
                    .font(.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
            )
        }
        return AnyView(EmptyView())
    }
    
    func getUserDesignation() -> AnyView {
        if let userName = article.user?[0].designation {
            return AnyView (
                Text(userName)
                    .fontWeight(.semibold)
                    .lineLimit(2)
            )
        }
        return AnyView(EmptyView())
    }
    
    func getUserAvatar() -> AnyView {
        if let userAvatar = article.user?[0].avatar {
            return AnyView (
                RemoteImageView(urlString: userAvatar, defaultImageString: "Profile_Pic")
                    .frame(width: 80, height: 80, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(Color.green, lineWidth: 2))
                    .shadow(radius: 10)
            )
        }
        return AnyView(EmptyView())
    }
    
    func getArticleTitle() -> AnyView {
        if article.media!.count > 0, let articleTitle = article.media?[0].title {
            return AnyView (
                Text(articleTitle)
                    .font(.headline)
                    .fontWeight(.heavy)
            )
        }
        return AnyView(EmptyView())
    }
    
    func getArticleUrl() -> AnyView {
        if article.media!.count > 0, let articleUrl = article.media?[0].url {
            return AnyView (
                Text(articleUrl)
                    .font(.subheadline)
                    .fontWeight(.medium)
            )
        }
        return AnyView(EmptyView())
    }
    
    func getLikesCount() -> AnyView {
        if let articleLikes = article.likes {
            return AnyView (
                Text("\(articleLikes) Likes")
                    .font(.headline)
            )
        }
        return AnyView(EmptyView())
    }
    
    func getCommentsCount() -> AnyView {
        if let articleLikes = article.comments {
            return AnyView (
                Text("\(articleLikes) Comments")
                    .font(.headline)
            )
        }
        return AnyView(EmptyView()) 
    }
    
    func getArticleImage() -> AnyView {
        if article.media!.count > 0, let articleImage = article.media?[0].image {
            return AnyView (
                RemoteImageView(urlString: articleImage, defaultImageString: "ArticleMedia")
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1))
                    .shadow(radius: 10)
            )
        }
        return AnyView(EmptyView())
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCellView()
    }
}
