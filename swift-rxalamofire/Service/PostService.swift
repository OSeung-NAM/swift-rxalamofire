//
//  PostService.swift
//  swift-rxalamofire
//
//  Created by OSeung Nam on 2021/07/05.
//

import Foundation
import RxSwift

class PostService {
    
    @Inject private var apiUrlService: APIUrlService
    @Inject private var apiRequestService: APIRequestService
    
    //포스트 리스트 조회 메소드
    func getPostList()-> Observable<[PostRPModel]>? {
        let URL = apiUrlService.serviceUrl(version: "", path: "/posts")
        
        return apiRequestService.getable(URL: URL, query: nil)
    }
}
