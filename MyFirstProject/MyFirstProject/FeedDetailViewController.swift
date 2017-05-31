//
//  FeedDetailViewController.swift
//  MyFirstProject
//
//  Created by std116 on 5/30/17.
//  Copyright © 2017 std116. All rights reserved.
//

import UIKit

class FeedDetailViewController: UIViewController {
    
    @IBOutlet weak var headerImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var accessoryLabel: UITextView!
    @IBOutlet weak var detailTexView: UILabel!

    var news:News?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

 //     self.news = News(title: "iOS", description: "Error lets  stop doing this", iconImage: #imageLiteral(resourceName: "cheese_flat"), author: "payut", view: 2, creatDate: "29/06/60", catagory: "Mobile")
        self.setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickSaveButton(_ sender: Any) {
        print("Click Save Button")
        if let news = self.news{
        persist.save(news: news)
        }
    }

    
    func setupUI() {
        
        if let news = self.news {
            self.headerImgView.image = news.iconImage
            self.titleLabel.text = news.title
            self.detailTexView.text = news.description
            self.accessoryLabel.text = "\(news.author) -  \(news.view) view - \(news.createDate)"
        }
    }

}
