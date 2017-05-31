//
//  FeedViewController.swift
//  MyFirstProject
//
//  Created by std116 on 5/29/17.
//  Copyright © 2017 std116. All rights reserved.
//

import UIKit

class SaveFeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var newArray:[News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupTableViewDummyData()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupTableViewDummyData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func setupTableView() {
        self.tableView.register(UINib(nibName:"FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
    }
    
    func setupTableViewDummyData() {
        self.newArray = persist.load()
        self.tableView.reloadData()
        

    }
    
    
    func toSaveFeedDetailViewController(news: News) {
        if let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "SaveFeedDetailViewController") as? SaveFeedDetailViewController {
            ViewController.news = news
            self.navigationController?.pushViewController(ViewController, animated: true)
        }
        
    }
    
    
}


extension SaveFeedViewController:UITableViewDataSource,UITableViewDelegate{
    
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
        self.toSaveFeedDetailViewController(news: news)
        
        
    }
    
}
