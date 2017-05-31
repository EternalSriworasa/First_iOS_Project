//
//  FeedViewController.swift
//  MyFirstProject
//
//  Created by std116 on 5/29/17.
//  Copyright © 2017 std116. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
  
    var newArray:[News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupTableViewDummyData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func setupTableView() {
        self.tableView.register(UINib(nibName:"FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
    }
    
    func setupTableViewDummyData() {
        let news:News = News(id: 1, title: "iOS", description: "Error lets  stop doing this", iconImage: #imageLiteral(resourceName: "cheese_flat"), author: "payut", view: 2, createDate: "29/06/60", category: "Mobile")
        let news2:News = News(id: 2, title: "Adroid", description: "Error lets  stop doing this", iconImage: #imageLiteral(resourceName: "cat"), author: "jack", view: 9999, createDate: "30/06/60", category: "Mobile")
        let news3:News = News(id: 3,title: "Premier League", description: "Premier League Football News", iconImage: #imageLiteral(resourceName: "dog"), author: "Niran", view: 100, createDate: "30/06/60", category: "Sport")
        let news4:News = News(id: 4, title: "Cannes Film Festival", description: "Art world satire The Square", iconImage: #imageLiteral(resourceName: "github_512"), author: "Niran", view: 100, createDate: "30/06/60", category: "Entertainment")
        let news5:News = News(id: 5, title: "งานเข้าพรรษา", description: "บรรยากาศการแห่เทียนในจังหวัด อุบลราชธานี", iconImage: #imageLiteral(resourceName: "rocket_icon2"), author: "Niran", view: 100, createDate: "30/06/60", category: "ศิลปวัฒนธรรม")

        newArray.append(news)
        newArray.append(news2)
        newArray.append(news3)
        newArray.append(news4)
        newArray.append(news5)
    }
    
    
    func toFeedDetailViewController(news: News) {
        if let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "FeedDetailViewController") as? FeedDetailViewController {
            ViewController.news = news
            self.navigationController?.pushViewController(ViewController, animated: true)
    }
    
}


}


extension FeedViewController:UITableViewDataSource,UITableViewDelegate{
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
        let rowNo = indexPath.row
        let news:News = newArray[rowNo]
        cell.setupUI(news: news)
                return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowNo = indexPath.row
        let news:News = newArray[rowNo]
        self.toFeedDetailViewController(news: news)
        
        
    }
    
}
