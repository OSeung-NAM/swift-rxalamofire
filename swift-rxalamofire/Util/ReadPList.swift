//
//  ReadPList.swift
//  swift-rxalamofire
//
//  Created by OSeung Nam on 2021/07/05.
//

import Foundation

class ReadPList {

    func getAPIUrlPlistInfo() -> String {
        var returnValue:String = ""
        if let config = getPlist(withName: "APIUrl") {
            // 키 값을 dictionary 조회하듯이 조회합니다.
            // 마찬가지로 optional 이기 때문에 if 로 검사해줍니다.
            // 개발, 운영으로 나눠서 개발 및 운영시 분기처리하여 테스트 가능하도록 환경세팅
            if let DEV_FLAG = config["DEV_FLAG"] as? Bool {
                print("개발여부:\(DEV_FLAG)")
                
                if DEV_FLAG {
                    if let DEV_API_URL = config["DEV_API_URL"] as? String {
                        print("개발서버 url:\(DEV_API_URL)")
                        returnValue = DEV_API_URL
                    }
                }else {
                    if let PROD_API_URL = config["PROD_API_URL"] as? String {
                        print("운영서버 url:\(PROD_API_URL)")
                        returnValue = PROD_API_URL
                    }
                }
            }
        }
        return returnValue
    }
        
    private func getPlist(withName name: String) -> [String: Any]?
    {
        if  let path = Bundle.main.path(forResource: name , ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String: Any]
        }
        return nil
    }
    
}
