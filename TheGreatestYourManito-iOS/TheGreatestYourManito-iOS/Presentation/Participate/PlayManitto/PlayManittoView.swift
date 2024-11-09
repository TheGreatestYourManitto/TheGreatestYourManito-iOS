//
//  PlayManittoView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

struct PlayManittoView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: PlayManittoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            YMHeaderTagView(
                topDesc: "나의 마니또", // TODO: Literal 파일 추가시 이동
                name: viewModel.receiverUserName,
                afterNameText: "에게"
            )
                .padding(.horizontal, 16)
            Spacer()
            PlayManittoBottomView()
                .frame(height: 557)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .shadow(radius: 10)
        }
        .environmentObject(viewModel)
        .background(.gray4)
        .ymNavBar(center: {
            Text(viewModel.manittoRoomName)
                .font(.pretendardFont(for: .heading5))
        }, left: {
            Button(action: {
                dismiss()
            }) {
                Image(.icnLeftnarrow)
            }
        })
        .ignoresSafeArea(.container, edges: .bottom)
        .navigationDestination(isPresented: $viewModel.isNextScreenActive, destination: { PlayManittoResultView(todaysCheeringCount: viewModel.todaysCheeringCount) })
    }
}
