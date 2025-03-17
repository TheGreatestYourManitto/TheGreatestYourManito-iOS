//
//  AfterJoinRoomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/28/24.
//

import SwiftUI

struct AfterJoinRoomView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: JoinRoomViewModel
    @State private var isCopyOnClipBoard: Bool = false
    @State private var isShowingShareSheet: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                headerView
                Spacer()
            }
            .ymNavBar(left: {
                Button(action: { dismiss() }) {
                    Image(.icnLeftnarrow)
                }
            })
        }
        .safeAreaInset(edge: .bottom) {
            bottomView
                .frame(height: 495)
                .background(.ymWhite)
                .cornerRadius(40, corners: [.topLeft, .topRight])
                .shadow(radius: 2)
        }
        .onAppear {
            viewModel.getRoomInfo(roomId: viewModel.roomId)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationDestination(isPresented: $viewModel.goMainView) {
            MainView(viewModel: .init())
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 21) {
            VStack {
                HStack {
                    Text(viewModel.roomName)
                        .font(.pretendardFont(for: .heading2))
                        .foregroundColor(.ymBlack)
                        .lineLimit(2)
                    Spacer()
                }
                YMJoinCodeStackView(joinCode: viewModel.joinCode, isCopyOnClipBoard: $isCopyOnClipBoard, isShowingShareSheet: $isShowingShareSheet)
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var bottomView: some View {
        AfterJoinRoomBottomView(isCopyOnClipBoard: $isCopyOnClipBoard)
            .environmentObject(viewModel)
    }
    
}
