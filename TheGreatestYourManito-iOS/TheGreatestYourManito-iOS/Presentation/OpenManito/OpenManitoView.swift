//
//  OpenManitoView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/13/24.
//

import SwiftUI

enum manitoResultType {
    case notOpen
    case open
}

struct OpenManitoView: View {
    @State var manitoResultType: manitoResultType
    @State var isLoading: Bool = false
    @StateObject var viewModel: OpenMaintoViewModel
    
    var body: some View {
        VStack {
            switch manitoResultType {
            case .notOpen:
                VStack(alignment: .leading, spacing: 0) {
                    Text(StringLiterals.OpenManito.notOpenTitleLabel1)
                        .font(.pretendardFont(for: .heading4))
                        .foregroundColor(.ymBlack)
                    Text(StringLiterals.OpenManito.notOpenTitleLabel2)
                        .font(.pretendardFont(for: .heading4))
                        .foregroundColor(.ymBlack)
                }
                .padding(.top, 135)
            case .open:
                Text(StringLiterals.OpenManito.openTitleLabel)
                    .font(.pretendardFont(for: .heading4))
                    .foregroundColor(.ymBlack)
                    .padding(.top, 135)
            }
            
            Spacer(minLength: 58)
            
            switch manitoResultType {
            case .notOpen:
                VStack(alignment: .center) {
                    Text("???")
                        .font(.pretendardFont(for: .heading1))
                        .foregroundStyle(.gray1)
                        .background(.gray3)
                }
                .frame(width: 300, height: 300)
                .background(.gray3)
                .clipShape(.rect(cornerRadius: 16))
            case .open:
                Text(viewModel.receiverName+"!")
                    .font(.pretendardFont(for: .heading1))
                    .foregroundColor(.ymBlack)
            }
            
            Spacer()
            Spacer()
            
            switch manitoResultType {
            case .notOpen:
                YMButton(title: StringLiterals.OpenManito.notOpenButtonStr, buttonType: .confirm) {
                    isLoading = true // 로딩 상태 활성화
                    
                    // 5초 후에 로딩 해제 및 화면 전환 수행
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                        self.manitoResultType = .open
                        isLoading = false
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            case .open:
                YMButton(title: StringLiterals.OpenManito.openButtonStr, buttonType: .confirm, action: {
                    print("공개 이후")
                    viewModel.isOpenType = true
                })
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            }
        }
        .navigationDestination(isPresented: $viewModel.isOpenType) {
            PlayManittoView(
                viewModel: PlayManittoViewModel(
                    receiverUserName: viewModel.receiverName,
                    receiverUserId: viewModel.receiverID,
                    manittoRoomName: viewModel.room.roomName,
                    manittoRoomId: viewModel.room.roomId,
                    manittoEndDate: viewModel.room.endDate
                )
            )
        }
        .overlay(
            Group {
                if isLoading {
                    YMLoadingView(titleText: "나의 마니또는..?!")
                }
            }
        )
        .onAppear {
            viewModel.getManittoReceiver(roomId: viewModel.room.roomId)
        }
    }
    
}


