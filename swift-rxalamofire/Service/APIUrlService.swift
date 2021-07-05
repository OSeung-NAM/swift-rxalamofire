//
//  APIUrlService.swift
//  swift-rxalamofire
//
//  Created by OSeung Nam on 2021/07/05.
//

import Foundation

class APIUrlService {
    
    @Inject var readPList: ReadPList
    
    func serviceUrl(version: String,path: String) -> String {
       //개발
        return readPList.getAPIUrlPlistInfo() + version + path
   }
}
