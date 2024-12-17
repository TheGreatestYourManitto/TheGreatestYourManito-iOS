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
                topDesc: StringLiterals.PlayManitto.headerTopDescriptionLabel,
                name: viewModel.receiverUserName,
                afterNameText: StringLiterals.PlayManitto.headerTopDescriptionLabelAfterNameStr
            )
            .padding(.horizontal, 16)
            Spacer()
            PlayManittoBottomView()
                .frame(height: 557)
                .cornerRadius(40, corners: [.topLeft, .topRight])
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
        .navigationDestination(isPresented: $viewModel.isNextScreenActive, destination: { PlayManittoResultView(todaysCheeringCount: viewModel.todaysCheeringCount)
            .navigationBarBackButtonHidden()})
    }
}
