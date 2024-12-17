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
            Spacer(minLength: 12)
            HStack {
                YMHeaderTagView(
                    topDesc: StringLiterals.PlayManitto.headerTopDescriptionLabel,
                    name: viewModel.receiverUserName,
                    afterNameText: StringLiterals.PlayManitto.headerTopDescriptionLabelAfterNameStr
                )
                Spacer()
            }
            .padding(.horizontal, 16)
            Spacer(minLength: 30)
        }
        .safeAreaInset(edge: .bottom) {
            PlayManittoBottomView()
                .frame(height: 577)
                .cornerRadius(40, corners: [.topLeft, .topRight])
                .shadow(radius: 2)
        }
        .overlay(
            Group {
                if viewModel.showToast {
                    VStack {
                        Spacer()
                        CopyToastView(textTitle: viewModel.toastText)
                            .padding(.bottom, 140)
                            .padding(.horizontal, 16)
                    }
                }
            }
        )
        .dismissKeyboardOnTapOrDrag()
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
        .navigationDestination(isPresented: $viewModel.isNextScreenActive, destination: { PlayManittoResultView(todaysCheeringCount: viewModel.todaysCheeringCount)
            .navigationBarBackButtonHidden()})
    }
}
