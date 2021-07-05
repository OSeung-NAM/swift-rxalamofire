//
//  AppDelegate.swift
//  swift-rxalamofire
//
//  Created by OSeung Nam on 2021/07/05.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        utilRegisterDependencies()
        serviceRegisterDependencies()
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }

    private func utilRegisterDependencies() {
        DIContainer.shared.register(ReadPList())
        DIContainer.shared.register(GlobalAlert())
        let readPList: ReadPList = DIContainer.shared.resolve()
        let globalAlert: GlobalAlert = DIContainer.shared.resolve()
        DIContainer.shared.register(readPList)
        DIContainer.shared.register(globalAlert)
    }

    private func serviceRegisterDependencies() {
        DIContainer.shared.register(HeaderCommon())
        DIContainer.shared.register(APIRequestService())
        DIContainer.shared.register(APIUrlService())
        DIContainer.shared.register(PostService())
        let headerCommon: HeaderCommon = DIContainer.shared.resolve()
        let apiRequestService: APIRequestService = DIContainer.shared.resolve()
        let apiUrlService: APIUrlService = DIContainer.shared.resolve()
        let postService: PostService = DIContainer.shared.resolve()
        DIContainer.shared.register(headerCommon)
        DIContainer.shared.register(apiRequestService)
        DIContainer.shared.register(apiUrlService)
        DIContainer.shared.register(postService)
    }
}

