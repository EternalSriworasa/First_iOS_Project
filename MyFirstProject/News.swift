//
//  News.swift
//  MyFirstProject
//
//  Created by std116 on 5/29/17.
//  Copyright © 2017 std116. All rights reserved.
//

import UIKit

class News {
    
    var title           :String
    var description     :String
    var iconImage       :UIImage
    var author          :String
    var view            :Int
    var creatDate       :String
    var catagory        :String
    
    init(title:String , description: String, iconImage: UIImage, author:String, view: Int, creatDate: String, catagory: String) {
        self.title = title
        self.description = description
        self.iconImage = iconImage
        self.author = author
        self.view = view
        self.creatDate = creatDate
        self.catagory = catagory
    }
}
