//
//  ObservableType.swift
//  swift-rxalamofire
//
//  Created by OSeung Nam on 2021/07/05.
//

import RxSwift

//RxAlamofire 통신 후 통신데이터 가공해주기 위한 확장파일
extension ObservableType {
    
    public func mapObject<T: Codable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            let responseTuple = data as? (HTTPURLResponse, Data)
            
            guard let jsonData = responseTuple?.1 else {
                throw NSError(
                    domain: "",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "JSON모델 디코딩 에러"]
                )
            }
            
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: [])
            //json데이터print해서 볼 수 있도록 조치.
            print(json)
            let decoder = JSONDecoder()
            let object = try decoder.decode(T.self, from: jsonData)
            
            return Observable.just(object)
        }
    }
}
