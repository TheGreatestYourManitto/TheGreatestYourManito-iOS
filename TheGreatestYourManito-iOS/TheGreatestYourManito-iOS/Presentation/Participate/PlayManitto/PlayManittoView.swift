//
//  PlayManittoView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI
// TODO: 커스텀 네비게이션 바 만들기

struct PlayManittoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            NameTagView(name: "꾸까?")
                .padding(.horizontal, 16)
            Spacer()
            PlayManittoBottomView()
                .frame(height: 557)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .shadow(radius: 10)
        }
        .background(.gray4)
        .ignoresSafeArea(.container, edges: .bottom)
    }
}
