//
//  TheGreatestYourManito_iOSApp.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/22/24.
//

import SwiftUI

import Firebase
import FirebaseMessaging

@main
struct TheGreatestYourManito_iOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            IntroView(viewModel: IntroViewModel())
                .navigationBarBackButtonHidden()
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    /// 앱이 처음 실행될 때 -> 푸시 알림 권한 요청 (알럿, 뱃지, 사운드)
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
                
        FirebaseApp.configure()
        
        UNUserNotificationCenter.current().delegate = self
        Messaging.messaging().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions
        ) { _, _ in }
        application.registerForRemoteNotifications()
        
        return true
    }
}

extension AppDelegate: MessagingDelegate {
    func messaging(
        _ messaging: Messaging,
        didReceiveRegistrationToken fcmToken: String?
    ) {
        guard let fcmToken else { return }
        print("FCM 등록용 토큰: \(fcmToken)")
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    /// 앱 상태가 Foreground일 때도 알림을 보낼 수 있도록
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.list, .banner])
    }
}
