//
//  HeaderCommon.swift
//  swift-rxalamofire
//
//  Created by OSeung Nam on 2021/07/05.
//

import Foundation
import Alamofire

//공통 헤더
class HeaderCommon {
    
    static let shareInstance = HeaderCommon()
    
    func headerSetting()-> HTTPHeaders{
        let requestUUID: String = UUID().uuidString.lowercased()
        let userAgent:String = HTTPHeader.defaultUserAgent.value
        
        let headers: HTTPHeaders = [
            "Content-Type":"application/json",
            "Accept":"application/json",
            "X-Request-Id":requestUUID,
            "user-agent":userAgent
        ]

        return headers
    }
}
