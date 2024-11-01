//
//  CreateRoom_AfterWriteBottomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/28/24.
//

import SwiftUI

struct CreateRoom_AfterWriteBottomView: View {
    @Binding var memberCount: Int
    @Binding var memberListModel: [JoinMemberModel]
    @State private var showDeleteSheet = false
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            VStack(spacing: 18) {
                HStack {
                    MemberCountLabelView(memberCount: $memberCount)
                    Spacer()
                }
                ScrollView {
                    MemberListView(memberListModel: $memberListModel, showDeleteSheet: $showDeleteSheet)
                }
                .frame(maxHeight: 300)
            }
            
            
            Spacer(minLength: 18)
            
            VStack(spacing: 20) {
                YMButton(title: "확인", buttonType: .confirm, action: {
                    showSheet.toggle()
                }).modifier(YMBottomSheetModifier(contentView: {
                    bottomSheetContentView(showSheet: $showSheet, bottomSheetContentType: .confirm)
                        .background(.ymWhite)
                }, showSheet: $showSheet, sheetHeight: 310, bottomSheetType: .nonDragBar))
            }
            .background(.ymWhite)
        }
        .padding(.horizontal, 16)
        .padding(.top, 48)
        .padding(.bottom, 54)
        .background(.ymWhite)
    }
}

extension CreateRoom_AfterWriteBottomView {
    struct MemberCountLabelView: View {
        @Binding var memberCount: Int
        
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("총 \(memberCount)명")
                    .font(.pretendardFont(for: .heading4))
                    .foregroundStyle(.ymBlack)
                
                Text(StringLiterals.CreateRoomView_AfterWrite.noticeWordLabel)
                    .font(.pretendardFont(for: .subtitle1))
                    .foregroundStyle(.gray1)
            }
            .padding(.leading, 16)
        }
    }
}

extension CreateRoom_AfterWriteBottomView {
    struct MemberListView: View {
        @Binding var memberListModel: [JoinMemberModel]
        @Binding var showDeleteSheet: Bool
        
        var body: some View {
            VStack(spacing: 16) {
                ForEach(memberListModel, id: \.memberName) { memberListModel in
                    ZStack {
                        Rectangle()
                            .frame(height: 68, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.gray3, lineWidth: 1)
                                    .background(.ymWhite)
                            )
                        
                        HStack {
                            //TODO: 추후 memberListModel 사용 코드로 전환
                            
                            //                            Text("박신영 짱")
                            Text("\(memberListModel.memberName)")
                                .font(.pretendardFont(for: .heading5))
                                .foregroundStyle(.ymBlack)
                            
                            Spacer()
                            YMCircleButton(circleBtnType: .cancel, action: {
                                showDeleteSheet.toggle()
                            }).modifier(YMBottomSheetModifier(contentView: {
                                bottomSheetContentView(showSheet: $showDeleteSheet, bottomSheetContentType: .delete)
                                    .background(.ymWhite)
                                    //여기도 .delete 버전에서 양 끝 white 잘리는거 해결됨.
                            }, showSheet: $showDeleteSheet, sheetHeight: 310, bottomSheetType: .nonDragBar))
                        }
                        .padding(.horizontal, 20)
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

extension CreateRoom_AfterWriteBottomView {
    
    struct bottomSheetContentView: View {
        @Binding var showSheet: Bool
        var bottomSheetContentType: BottomSheetContentType
        
        var body: some View {
            VStack {
                bottomSheetContentImage(bottomType: bottomSheetContentType)
                    .padding(.top, 20)
                bottomSheetContentLabel(bottomType: bottomSheetContentType)
                    .padding(.top, 24)
                Spacer(minLength: 46)
                bottomSheetContentButton(bottomType: bottomSheetContentType)
                    .padding(.bottom, 20)
            }
            .background(.ymWhite)
            .padding(.horizontal, 10)
            // 이걸 주고 .confirm 양 옆 화면 색 잘림이 해결됨.
            
        }
        
        private func bottomSheetContentImage(bottomType: BottomSheetContentType) -> some View {
            ZStack {
                Circle()
                    .fill(bottomType.fillColor)
                    .frame(width: 80, height: 80)
                    .overlay(
                        bottomType.fillImage
                            .frame(width: 48, height: 48, alignment: .center)
                    )
            }
        }
        
        private func bottomSheetContentLabel(bottomType: BottomSheetContentType) -> some View {
            VStack(alignment: .center, spacing: 8) {
                if bottomType == .delete {
                    HStack(spacing: 0) {
                        Text("박신영 짱")
                            .font(.pretendardFont(for: .heading3))
                            .foregroundStyle(.ymPrimary)
                        bottomType.titleText
                    }
                } else {
                    bottomType.titleText
                }
                bottomType.subText
            }
            
        }
        
        private func bottomSheetContentButton(bottomType: BottomSheetContentType) -> some View {
            HStack(alignment: .center, spacing: 17) {
                Rectangle()
                    .fill(.gray3)
                    .frame(width: 164, height: 64)
                    .cornerRadius(24, corners: .allCorners)
                    .overlay(
                        bottomType.leftBtnText
                    )
                    .onTapGesture {
                        showSheet = false
                    }
                
                Rectangle()
                    .fill(.ymPrimary)
                    .frame(width: 164, height: 64)
                    .cornerRadius(24, corners: .allCorners)
                    .overlay(
                        bottomType.rightBtnText
                    )
                
            }.padding(.horizontal, 15)
        }
    }
    
}

#Preview {
    CreateRoomView_AfterWrite(text: "tqeqwx", roomName: "ㄴㄴㄴ", joinCode: "~~~~~~~~~", memberCount: 1, memberListModel: [JoinMemberModel(memberName: "하세요2"), JoinMemberModel(memberName: "하세요1"), JoinMemberModel(memberName: "하세요"), JoinMemberModel(memberName: "하세요"),JoinMemberModel(memberName: "하세요4")])
}
