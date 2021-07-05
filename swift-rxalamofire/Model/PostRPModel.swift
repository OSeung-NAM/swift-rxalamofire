//
//  PostRPModel.swift
//  swift-rxalamofire
//
//  Created by OSeung Nam on 2021/07/05.
//

struct PostRPModel: Codable {
    
    let body : String?
    let id : Int?
    let title : String?
    let userId : Int?

    enum CodingKeys: String, CodingKey {
            case body = "body"
            case id = "id"
            case title = "title"
            case userId = "userId"
    }
}
