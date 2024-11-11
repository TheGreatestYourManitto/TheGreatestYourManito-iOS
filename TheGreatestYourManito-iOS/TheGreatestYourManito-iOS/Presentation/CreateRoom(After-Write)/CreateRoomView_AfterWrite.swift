//
//  CreateRoomView_AfterWrite.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/28/24.
//

import SwiftUI



struct CreateRoomView_AfterWrite: View {
    @Environment(\.dismiss) private var dismiss
    @State var roomName: String
    @State var joinCode: String
    @State var memberCount: Int
    @State var memberListModel: [JoinMemberModel]
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 28) {
                headerView
                bottomView
            }
            .ymNavBar(left: {
                Button(action: { dismiss() })
                { Image(.icnLeftnarrow)} } )
        }
        .padding(.bottom, 20)
        
    }
    
    private var headerView: some View {
        VStack(spacing: 21) {
            VStack {
                HStack {
                    CreateRoom_AfterWriteTitleLabelView(roomName: $roomName)
                    Spacer()
                }
                YMJoinCodeStackView(joinCode: joinCode)
            }
            .padding(.horizontal, 20)
            
        }
    }
    
    private var bottomView: some View {
        CreateRoom_AfterWriteBottomView(memberCount: $memberCount, memberListModel: $memberListModel)
                        .cornerRadius(40, corners: [.topLeft, .topRight])
                        .shadow(radius: 2)
    }
    
    private var navigationButton: some View {
        Button(action: { dismiss() }) {
            Image(.icnLeftnarrow)
        }
    }
}

struct CreateRoom_AfterWriteTitleLabelView: View {
    @Binding var roomName: String
    
    var body: some View {
        Text(roomName)
            .font(.pretendardFont(for: .heading2))
            .foregroundColor(.ymBlack)
    }
}




