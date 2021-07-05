//
//  APIRequestService.swift
//  swift-rxalamofire
//
//  Created by OSeung Nam on 2021/07/05.
//

import Alamofire
import RxSwift
import RxAlamofire
import SystemConfiguration //네트워크 연결상태 확인을 위한 라이브러리

class APIRequestService {
    func getable<T:Codable>(URL:String, query:[String:Any]? )-> Observable<T>? {
        if isInternetAvailable() {
            let headers = HeaderCommon.shareInstance.headerSetting()
            return RxAlamofire.requestData(.get, URL, parameters: query, encoding: URLEncoding.default, headers: headers, interceptor: .none)
                .mapObject(type: T.self)
        }else {
            if let keyWindow = UIApplication.shared.connectedScenes
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first {
                
                if var viewController = keyWindow.rootViewController {
                    while viewController.presentedViewController != nil {
                        viewController = viewController.presentedViewController!
                    }
//                    GlobalAlert.shared.commonAlert(title: "네트워크 연결 확인\n", content: "네트워크 연결이 되어있지 않습니다.\n연결상태를 확인해주세요.", vc: viewController)
//                    GlobalLoading.shared.endLoading()
                }
            }
            return nil
        }
       
    }
    
    func postable<T:Codable>(URL:String, body:[String:Any]? )-> Observable<T>? {
        if isInternetAvailable() {
            let headers = HeaderCommon.shareInstance.headerSetting()
            return RxAlamofire.requestData(.post, URL, parameters: body, encoding: JSONEncoding.default, headers: headers, interceptor: .none)
                .mapObject(type: T.self)
        }else {
            if let keyWindow = UIApplication.shared.connectedScenes
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first {
                
                if var viewController = keyWindow.rootViewController {
                    while viewController.presentedViewController != nil {
                        viewController = viewController.presentedViewController!
                    }
//                    GlobalAlert.shared.commonAlert(title: "네트워크 연결 확인\n", content: "네트워크 연결이 되어있지 않습니다.\n연결상태를 확인해주세요.", vc: viewController)
//                    GlobalLoading.shared.endLoading()
                }
            }
            return nil
        }
        
    }
    
    func deletaable<T:Codable>(URL:String, body:[String:Any]?)-> Observable<T>? {
        if isInternetAvailable() {
            let headers = HeaderCommon.shareInstance.headerSetting()
            return RxAlamofire.requestData(.delete, URL, parameters: body, encoding: JSONEncoding.default, headers: headers, interceptor: .none)
                .mapObject(type: T.self)
        }else {
            if let keyWindow = UIApplication.shared.connectedScenes
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first {
                
                if var viewController = keyWindow.rootViewController {
                    while viewController.presentedViewController != nil {
                        viewController = viewController.presentedViewController!
                    }
//                    GlobalAlert.shared.commonAlert(title: "네트워크 연결 확인\n", content: "네트워크 연결이 되어있지 않습니다.\n연결상태를 확인해주세요.", vc: viewController)
//                    GlobalLoading.shared.endLoading()
                }
            }
            return nil
        }
        
    }
    
    func putable<T:Codable>(URL:String, body:[String:Any]?)-> Observable<T>? {
        if isInternetAvailable() {
            let headers = HeaderCommon.shareInstance.headerSetting()
            return RxAlamofire.requestData(.put, URL, parameters: body, encoding: JSONEncoding.default, headers: headers, interceptor: .none)
                .mapObject(type: T.self)
        }else {
            if let keyWindow = UIApplication.shared.connectedScenes
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first {
                
                if var viewController = keyWindow.rootViewController {
                    while viewController.presentedViewController != nil {
                        viewController = viewController.presentedViewController!
                    }
//                    GlobalAlert.shared.commonAlert(title: "네트워크 연결 확인\n", content: "네트워크 연결이 되어있지 않습니다.\n연결상태를 확인해주세요.", vc: viewController)
//                    GlobalLoading.shared.endLoading()
                }
            }
            return nil
        }
       
    }
    
    func patchable<T:Codable>(URL:String, body:[String:Any]?)-> Observable<T>? {
        if isInternetAvailable() {
            let headers = HeaderCommon.shareInstance.headerSetting()
            return RxAlamofire.requestData(.patch, URL, parameters: body, encoding: JSONEncoding.default, headers: headers, interceptor: .none)
                .mapObject(type: T.self)
        }else {
            if let keyWindow = UIApplication.shared.connectedScenes
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first {
                
                if var viewController = keyWindow.rootViewController {
                    while viewController.presentedViewController != nil {
                        viewController = viewController.presentedViewController!
                    }
//                    GlobalAlert.shared.commonAlert(title: "네트워크 연결 확인\n", content: "네트워크 연결이 되어있지 않습니다.\n연결상태를 확인해주세요.", vc: viewController)
//                    GlobalLoading.shared.endLoading()
                }
            }
            return nil
        }
        
    }
    
    
    //네트워크 연결상태 확인
    func isInternetAvailable() -> Bool
        {
            var zeroAddress = sockaddr_in()
            zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
            zeroAddress.sin_family = sa_family_t(AF_INET)
            
            let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                    SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
                }
            }
            
            var flags = SCNetworkReachabilityFlags()

            if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {

                return false

            }

            let isReachable = flags.contains(.reachable)
            let needsConnection = flags.contains(.connectionRequired)

            return (isReachable && !needsConnection)
    }
}
