//
//  YMLoadingView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/13/24.
//

import SwiftUI

struct YMLoadingView: View {
    @State private var visibleCount = 0
    private let animationInterval = 0.4
    let titleText: String
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text(titleText)
                    .font(.pretendardFont(for: .heading4))
                    .foregroundColor(.ymWhite)
                HStack(spacing: 16) {
                    ForEach(CheerType.allCases.indices, id: \.self) { index in
                        Image(CheerType.allCases[index].defaultImage)
                            .opacity(index < visibleCount ? 1 : 0)
                            .animation(.easeInOut(duration: animationInterval), value: visibleCount)
                    }
                }
            }
        }
        .onAppear {
            startAnimation()
        }
    }
    
    private func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: animationInterval, repeats: true) { timer in
            visibleCount += 1
            
            if visibleCount > CheerType.allCases.count {
                visibleCount = 0 // 모든 이미지가 표시된 이후 모두 제거
            }
        }
    }
}

