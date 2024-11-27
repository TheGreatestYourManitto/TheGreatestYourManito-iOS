//
//  BeforeJoinRoomBottomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/12/24.
//

import SwiftUI

struct BeforeJoinRoomBottomView: View {
    
    @EnvironmentObject var viewModel: JoinRoomViewModel
    @State private var joinCode: String = ""
    @State private var navigateToAfterJoinRoom = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                BeforeJoinRoomBottomSheetTitleView
                Spacer()
            }
            .padding(.top, 48)
            
            VStack {
                YMTextField(placeholder: "참여코드", text: $joinCode)
                    .padding(.horizontal, 16)
                Spacer(minLength: 20)
                
                // 버튼 클릭 시 navigateToAfterJoinRoom 상태 변경
                confirmButton()
                    .padding(.horizontal, 16)
            }
            .padding(.top, 16)
        }
        .frame(height: 495)
        .background(Color.white)
        .padding(.bottom, 25)
        .navigationDestination(isPresented: $navigateToAfterJoinRoom) {
            AfterJoinRoomView(
                viewModel: _viewModel,
                joinCode: $joinCode
            )
            .environmentObject(viewModel)
        }
        
        
    }
    
    private var BeforeJoinRoomBottomSheetTitleView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(StringLiterals.BeforeJoinRoom.bottomSheetTitleLabel)
                .font(.pretendardFont(for: .heading4))
                .foregroundStyle(.ymBlack)
            Text(StringLiterals.BeforeJoinRoom.bottomSheetSubTitleLabel)
                .font(.pretendardFont(for: .subtitle1))
                .foregroundStyle(.gray1)
        }
        .padding(.leading, 18)
    }
    
    @ViewBuilder
    private func confirmButton() -> some View {
        YMButton(title: "확인", buttonType: .confirm) {
            viewModel.isLoading = true // 로딩 상태 활성화
            print("joinCode: \(joinCode)")
            viewModel.postParticipateRoom(invitationCode: joinCode)
            // 5초 후에 로딩 해제 및 화면 전환 수행
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                viewModel.isLoading = false
                navigateToAfterJoinRoom = true
            }
        }
    }
    
}
