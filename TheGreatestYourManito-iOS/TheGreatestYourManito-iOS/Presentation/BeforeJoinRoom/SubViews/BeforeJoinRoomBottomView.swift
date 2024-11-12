//
//  BeforeJoinRoomBottomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/12/24.
//

import SwiftUI

struct BeforeJoinRoomBottomView: View {
    @Binding var memberCount: Int
    @Binding var memberListModel: [JoinMemberModel]
    @State private var showDeleteSheet = false
    @State private var showSheet = false
    @State private var joinCode: String = ""
    @State private var navigateToAfterJoinRoom = false
    @Binding var isLoading: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                BeforeJoinRoomBottomSheetTitleView
                Spacer()
            }
            .padding(.top, 48)
            
            VStack {
                YMTextField(placeholder: "방 코드를 입력하세요", text: $joinCode)
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
                roomName: "api 통신 결과",
                memberCount: 4,
                memberListModel: [
                    JoinMemberModel(memberName: "psy"),
                    JoinMemberModel(memberName: "PSY"),
                    JoinMemberModel(memberName: "박신영"),
                    JoinMemberModel(memberName: "신영박")
                ],
                joinCode: $joinCode,
                roomType: .owner
            )
        }
        
        
    }
    
    private var BeforeJoinRoomBottomSheetTitleView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(StringLiterals.JoinRoom_Before.bottomSheetTitleLabel)
                .font(.pretendardFont(for: .heading4))
                .foregroundStyle(.ymBlack)
            Text(StringLiterals.JoinRoom_Before.bottomSheetSubTitleLabel)
                .font(.pretendardFont(for: .subtitle1))
                .foregroundStyle(.gray1)
        }
        .padding(.leading, 18)
    }
    
    @ViewBuilder
    private func confirmButton() -> some View {
        YMButton(title: "확인", buttonType: .confirm) {
            isLoading = true // 로딩 상태 활성화
            
            // 5초 후에 로딩 해제 및 화면 전환 수행
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
                navigateToAfterJoinRoom = true
            }
        }
    }
}

// 커스텀 로딩뷰
struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                ProgressView() // 기본 로딩 인디케이터
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
                Text("로딩 중...")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.top, 8)
            }
            .padding(20)
            .background(Color.gray.opacity(0.8))
            .cornerRadius(12)
        }
    }
}
