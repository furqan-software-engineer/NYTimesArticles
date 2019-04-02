//
//  ArticlesViewController.swift
//  NYArticles
//
//  Created by Furqan on 02/04/2019.
//  Copyright © 2019 Muhammad Furqan. All rights reserved.
//

import UIKit
import SafariServices
import NVActivityIndicatorView
import NotificationBannerSwift

class ArticlesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SFSafariViewControllerDelegate, NVActivityIndicatorViewable {
    
    
    @IBOutlet weak var tableviewArticles: UITableView!

    
    var articles = [Article]()
    
    var isDataUpdateRequire = true
    
    
    
    func getArticles() {
        startAnimating()
        ArticleWebservice().getPopularArticles(section: "all-sections", period: 7) { [weak self] (articles, error) in
            print(articles as Any)
            DispatchQueue.main.async {
                self?.stopAnimating()
                if articles != nil {
                    self?.articles = articles!
                    self?.tableviewArticles.reloadData()
                    if self?.articles.count == 0 {
                        self?.showErrorMessage(message: "no article found!")
                    }
                }
                else {
                    if error != nil {
                        self?.showErrorMessage(message: (error?.localizedDescription)!)
                    }
                    else {
                        self?.showErrorMessage(message: "something went wrong!")
                    }
                }
            }
        }
    }
    
    
    
    
    func showErrorMessage(message: String) {
        NotificationBanner(title: message, subtitle: nil, leftView: nil, rightView: nil, style: .danger, colors: nil).show()
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "NY Times Most Popular"
        tableviewArticles.tableFooterView = UIView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isDataUpdateRequire {
            isDataUpdateRequire = false
            getArticles()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        
        let article = articles[indexPath.row]
        cell.lblTitle.text = article.title
        cell.lblAuthor.text = article.author
        cell.lblDate.text = article.date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        if let urlString = article.url {
            openSafariVC(urlString: urlString)
        }
    }
    
    
    
    func openSafariVC(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }

}
