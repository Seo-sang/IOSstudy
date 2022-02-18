//
//  ViewController.swift
//  HelloWorld
//
//  Created by 서상현 on 2022/02/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //click event
    @IBAction func Click_moveBtn(_ sender: Any) {
        //storyboard find controller
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController") {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    //5강
    

}

