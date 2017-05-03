//
//  ViewController.swift
//  alamorife.test
//
//  Created by Nilson Junior on 05/3/17.
//
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {

    lazy var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
          
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func action(_ sender: Any) {
        loadPosts()
    }
    
    
//    func load(posts: (([Post]) -> Void)!) {
//        let urlString = "https://jsonplaceholder.typicode.com/posts"
//        let url = try! urlString.asURL()
//        Alamofire.request(url).validate().responseArray { (response: DataResponse<[Post]>) in
//            guard let postArray = response.result.value else {return}
//            posts(postArray)
//        }
//    }
    
    func loadPosts() {
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseCollection { (response: DataResponse<[Post]>) in

            
            if let posts = response.result.value {
                posts.forEach { print("- \($0.title)") }
            }
        }
    }
}

