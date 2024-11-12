//
//  AfterJoinRoomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/28/24.
//

import SwiftUI

enum RoomType {
    case owner
    case notOwner
}

struct AfterJoinRoomView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var roomName: String
    @State var memberCount: Int
    @State var memberListModel: [JoinMemberModel]
    @State private var isCopyOnClipBoard: Bool = false
    @Binding var joinCode: String
    let roomType: RoomType
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 28) {
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
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private var headerView: some View {
        VStack(spacing: 21) {
            VStack {
                HStack {
                    Text(roomName)
                        .font(.pretendardFont(for: .heading2))
                        .foregroundColor(.ymBlack)
                    Spacer()
                }
                YMJoinCodeStackView(joinCode: joinCode, isCopyOnClipBoard: $isCopyOnClipBoard)
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var bottomView: some View {
        AfterJoinRoomBottomView(memberCount: $memberCount, memberListModel: $memberListModel, isCopyOnClipBoard: $isCopyOnClipBoard, roomType: roomType)
    }
    
}


//#Preview {
//    AfterJoinRoomView(roomName: "ㄴㄴㄴ", joinCode: "~~~~~~~~~", memberCount: 1, memberListModel: [JoinMemberModel(memberName: "하세요2"), JoinMemberModel(memberName: "하세요1"), JoinMemberModel(memberName: "하세요"), JoinMemberModel(memberName: "하세요"),JoinMemberModel(memberName: "하세요4")], roomType: .owner)
//}



