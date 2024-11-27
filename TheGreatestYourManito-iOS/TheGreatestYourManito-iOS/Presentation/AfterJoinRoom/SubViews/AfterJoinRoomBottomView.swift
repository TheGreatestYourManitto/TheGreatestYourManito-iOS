//
//  AfterJoinRoomBottomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/28/24.
//

import SwiftUI

struct AfterJoinRoomBottomView: View {
    
    @EnvironmentObject var viewModel: JoinRoomViewModel
    @Binding var isCopyOnClipBoard: Bool
    @State private var showDeleteSheet = false
    @State private var showSheet = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                MemberCountLabelView()
                Spacer()
            }
            .padding(.top, 40)
            
            VStack(spacing: 18) {
                MemberListScrollView(showDeleteSheet: $showDeleteSheet)
                if case .owner = viewModel.roomType {
                    Spacer(minLength: 20)
                    confirmButton()
                }
            }
            .padding(.top, 18)
            .overlay(
                Group {
                    if isCopyOnClipBoard {
                        VStack {
                            Spacer()
                            CopyToastView()
                                .padding(.bottom, 90)
                                .padding(.horizontal, 16)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                    }
                }
            )
            .animation(.easeOut(duration: 0.3), value: isCopyOnClipBoard)
            Spacer(minLength: 20)
        }
        .environmentObject(viewModel)
        .frame(height: 495)
        .background(.ymWhite)
        .padding(.bottom, 25)
        
    }
    
    @ViewBuilder
    private func confirmButton() -> some View {
        YMButton(title: "확인", buttonType: .confirm) {
            showSheet.toggle()
        }
        .padding(16)
        .modifier(YMBottomSheetModifier(
            contentView: { BottomSheetContentView(showSheet: $showSheet, contentType: .confirm) },
            showSheet: $showSheet,
            sheetHeight: 310,
            bottomSheetType: .nonDragBar
        ))
    }
    
}

struct MemberCountLabelView: View {
    
    @EnvironmentObject var viewModel: JoinRoomViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("총 \(viewModel.memberCount)명")
                .font(.pretendardFont(for: .heading4))
                .foregroundStyle(.ymBlack)
            if case .owner = viewModel.roomType {
                Text(StringLiterals.AfterJoinRoom.ownerNoticeWordLabel)
                    .font(.pretendardFont(for: .subtitle1))
                    .foregroundStyle(.gray1)
            } else {
                Text(StringLiterals.AfterJoinRoom.notOwnerNoticeWordLabel)
                    .font(.pretendardFont(for: .subtitle1))
                    .foregroundStyle(.gray1)
            }
        }
        .padding(.leading, 32)
    }
    
}

struct MemberListScrollView: View {
    
    @EnvironmentObject var viewModel: JoinRoomViewModel
    @Binding var showDeleteSheet: Bool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(viewModel.memberListModel, id: \.memberName) { member in
                    MemberListItemView(member: member, showDeleteSheet: $showDeleteSheet)
                        .environmentObject(viewModel)
                }
            }
            .padding(.horizontal, 24)
        }
        .frame(maxHeight: 280)
    }
    
}

struct MemberListItemView: View {
    
    let member: JoinMemberModel
    @Binding var showDeleteSheet: Bool
    @EnvironmentObject var viewModel: JoinRoomViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray3, lineWidth: 1)
                .background(.ymWhite)
                .frame(height: 68)
            
            HStack {
                Text(member.memberName)
                    .font(.pretendardFont(for: .heading5))
                    .foregroundStyle(.ymBlack)
                Spacer()
                if case .owner = viewModel.roomType {
                    ymCircleDeleteButton()
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder
    private func ymCircleDeleteButton() -> some View {
        YMCircleButton(circleBtnType: .cancel) {
            showDeleteSheet.toggle()
        }
        .modifier(YMBottomSheetModifier(
            contentView: { BottomSheetContentView(showSheet: $showDeleteSheet, contentType: .delete) },
            showSheet: $showDeleteSheet,
            sheetHeight: 310,
            bottomSheetType: .nonDragBar
        ))
    }
    
}

struct BottomSheetContentView: View {
    
    @Binding var showSheet: Bool
    let contentType: BottomSheetContentType
    
    var body: some View {
        VStack(spacing: 0) {
            bottomSheetContentImage
                .padding(.top, 20)
            bottomSheetContentLabel
                .padding(.top, 24)
            bottomSheetContentButton
                .padding(.top, 46)
        }
        .background(.ymWhite)
    }
    
    private var bottomSheetContentImage: some View {
        ZStack {
            Circle()
                .fill(contentType.fillColor)
                .frame(width: 80, height: 80)
            contentType.fillImage
                .frame(width: 48, height: 48)
        }
    }
    
    private var bottomSheetContentLabel: some View {
        VStack(alignment: .center, spacing: 8) {
            if contentType == .delete {
                HStack(spacing: 0) {
                    Text("박신영 짱")
                        .font(.pretendardFont(for: .heading3))
                        .foregroundStyle(.ymPrimary)
                    contentType.titleText
                }
            } else {
                contentType.titleText
            }
            contentType.subText
        }
    }
    
    private var bottomSheetContentButton: some View {
        HStack(spacing: 17) {
            makeButton(color: .gray3, text: contentType.leftBtnText) {
                showSheet = false
            }
            makeButton(color: .ymPrimary, text: contentType.rightBtnText)
        }
        .padding(.horizontal, 15)
    }
    
    private func makeButton(color: Color, text: Text, action: (() -> Void)? = nil) -> some View {
        Rectangle()
            .fill(color)
            .frame(width: 164, height: 64)
            .cornerRadius(24)
            .overlay(text)
            .onTapGesture { action?() }
    }
    
}
