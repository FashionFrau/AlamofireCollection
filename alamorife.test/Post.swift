//
//  Post.swift
//  alamorife.test
//
//  Created by Nilson Junior on 05/3/17.
//
//

import Foundation
//import ObjectMapper
//
//class Post: Mappable {
//    var userId: Int?
//    var id: Int?
//    var title: String?
//    var body: String?
//    
//    required init?(map: Map) {
//        
//    }
//    
//    func mapping(map: Map) {
//        userId <- map["userId"]
//        id <- map["id"]
//        title <- map["title"]
//        body <- map["body"]
//    }
//}

struct Post: ResponseObjectSerializable, ResponseCollectionSerializable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
   
    init?(response: HTTPURLResponse, representation: Any) {
        guard
            let representation = representation as? [String: Any],
            let userId = representation["userId"] as? Int,
            let id = representation["id"] as? Int,
            let title = representation["title"] as? String,
            let body = representation["body"] as? String
            else { return nil }
        
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body

    }
}
