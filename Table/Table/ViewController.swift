//
//  ViewController.swift
//  Table
//
//  Created by 서상현 on 2022/02/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    var newsData : Array<Dictionary<String,Any>>?
    
    func getNews() {
        let task = URLSession.shared.dataTask(with: URL(string : "https://newsapi.org/v2/top-headlines?country=kr&apiKey=58af8578371e46a98fd14c16f84c8f10")!) { (data, response, error) in
            if let dataJson = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    let articles = json["articles"] as! Array<Dictionary<String,Any>>
                    self.newsData = articles
                    
                    DispatchQueue.main.async {
                        self.TableViewMain.reloadData()
                    }
                }
                catch {}
            }
        }
        
        task.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //데이터 몇개
        if let news = newsData {
            return news.count
        }
        else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //어떤 데이터를
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        let idx = indexPath.row
        
        if let news = newsData {
            let row = news[idx]
            
            if let r = row as? Dictionary<String,Any> {
                if let title = r["title"] as? String {
                    cell.LabelText.text = title
                }
           }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        getNews()
        
    }
    
    

}

