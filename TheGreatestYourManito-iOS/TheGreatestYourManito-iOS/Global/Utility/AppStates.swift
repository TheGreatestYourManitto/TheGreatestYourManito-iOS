//
//  LoadingState.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/4/24.
//

import Foundation

class AppStates: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    private init() {}
    
    static let shared = AppStates()
    
}
