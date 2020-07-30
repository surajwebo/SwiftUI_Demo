//
//  Article.swift
//  Articles
//
//  Created by Suraj on 28/07/20.
//  Copyright © 2020 Suraj. All rights reserved.
//

import Foundation

//struct ArticleResponse: Decodable {
//    let main: [Article]
//}

struct Article: Decodable, Hashable {
    var id: String?
    var createdAt: String?
    var content: String?
    var comments: Int?
    var likes: Int?
    var media: [Media]?
    var user: [User]?
}

struct Media: Decodable, Hashable {
    var id: String?
    var blogId: String?
    var createdAt: String?
    var image: String?
    var title: String?
    var url: String?
}

struct User: Decodable, Hashable {
    var id: String?
    var blogId: String?
    var createdAt: String?
    var name: String?
    var avatar: String?
    var lastname: String?
    var city: String?
    var designation: String?
    var about: String?
    
}

/*
 {
 "id":"1",
 "createdAt":"2020-04-17T12:13:44.575Z",
 "content":"calculating the program won't do anything, we need to navigate the multi-byte SMS alarm!",
 "comments":8237,
 "likes":62648,
 "media":[
 {
 "id":"1",
 "blogId":"1",
 "createdAt":"2020-04-16T22:43:18.606Z",
 "image":"https://s3.amazonaws.com/uifaces/faces/twitter/joe_black/128.jpg",
 "title":"maximized system",
 "url":"http://providenci.com"
 }
 ],
 "user":[
 {
 "id":"1",
 "blogId":"1",
 "createdAt":"2020-04-16T20:17:42.437Z",
 "name":"Dayton",
 "avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/erwanhesry/128.jpg",
 "lastname":"Haag",
 "city":"West Ima",
 "designation":"Human Group Assistant",
 "about":"Try to calculate the SDD bandwidth, maybe it will override the auxiliary card!"
 }
 ]
 },
 */
