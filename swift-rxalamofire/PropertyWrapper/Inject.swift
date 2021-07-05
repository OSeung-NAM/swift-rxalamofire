//
//  Inject.swift
//  swift-rxalamofire
//
//  Created by OSeung Nam on 2021/07/05.
//

@propertyWrapper
class Inject<T> {
    
    let wrappedValue: T
    
    init() {
        self.wrappedValue = DIContainer.shared.resolve()
    }
}
