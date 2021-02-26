//
//  News.swift
//  RestAPI
//
//  Created by Vennela Reddy on 2/25/21.
//

import Foundation

class News {
    
    var author : String = ""
    var title : String = ""
    var description : String = ""
    
    init(author : String, title : String , description: String){
        self.author = author
        self.title = title
        self.description = description
    }
}
