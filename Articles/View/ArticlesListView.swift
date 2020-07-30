//
//  ContentView.swift
//  Articles
//
//  Created by Suraj on 28/07/20.
//  Copyright © 2020 Suraj. All rights reserved.
//

import SwiftUI

struct ArticlesListView: View {
    @ObservedObject var articleVM: ArticleViewModel
    @State private var pageNo = 1
    init() {
        self.articleVM = ArticleViewModel()
        triggerGetArticlesRequest(isToLoadNextPage: true)
    }
    
    func triggerGetArticlesRequest(isToLoadNextPage: Bool) {
        if isToLoadNextPage == true {
            self.pageNo += 1
        } else {
            self.pageNo -= 1
        }
        if self.pageNo <= 0 {
            self.pageNo = 1
            return
        }
        if self.pageNo > 5 {
            self.pageNo = 5
            return
        }
        self.articleVM.pageNo = String(self.pageNo)
        self.articleVM.getArticles()
    }
        
    var body: some View {
        NavigationView {
            VStack {
                if self.articleVM.article.count > 0 {
                    List {
                        ForEach (self.articleVM.article, id: \.self) { article in
                            NavigationLink(destination: ArticleDetailView(article: article)) {
                                ArticleCellView(article: article)
                            }
                        }
                    }
                    HStack {
                        Button(action: {
                            self.triggerGetArticlesRequest(isToLoadNextPage: false)
                        }) {
                            HStack {
                                Text("<< Prev")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(width: 100, height: 50)
                        .background(Color.primary)
                        .cornerRadius(10)
                        
                        Spacer()
                        
                        Button(action: {
                            self.triggerGetArticlesRequest(isToLoadNextPage: true)
                        }) {
                            HStack {
                                Text("Next >>")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(width: 100, height: 50)
                        .background(Color.primary)
                        .cornerRadius(10)
                    }
                    .padding(.all)
                } else {
                    Text("Loading...")
                }
            }
            .navigationBarTitle("ARTICLES")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesListView()
    }
}
