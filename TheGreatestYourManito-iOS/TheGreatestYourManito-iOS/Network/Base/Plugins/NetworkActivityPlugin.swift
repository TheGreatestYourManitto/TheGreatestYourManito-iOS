//
//  NetworkActivityPlugin.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/4/24.
//

import Foundation

import Moya

final class NetworkActivityPlugin: PluginType {
    
    private var loadingState = AppStates.shared
    
    func willSend(_ request: RequestType, target: TargetType) {
        DispatchQueue.main.async {
            self.loadingState.isLoading = true
        }
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.loadingState.isLoading = false
        }
    }
    
}
