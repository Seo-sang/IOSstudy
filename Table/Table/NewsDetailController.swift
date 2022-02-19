//
//  NewsDetailController.swift
//  Table
//
//  Created by 서상현 on 2022/02/19.
//

import UIKit

class NewsDetailController : UIViewController {
    
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    
    var imageUrl : String?
    var desc : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let img = imageUrl {
            if let data = try? Data(contentsOf: URL(string : img)!) {
                DispatchQueue.main.async{
                    self.ImageMain.image = UIImage(data : data)
                }
            }
        }
        
        if let d = desc {
            self.LabelMain.text = d
        }
    }
}
