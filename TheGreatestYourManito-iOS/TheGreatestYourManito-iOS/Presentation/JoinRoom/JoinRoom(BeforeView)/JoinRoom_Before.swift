//
//  JoinRoom_Before.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/6/24.
//

import SwiftUI

struct JoinRoom_Before: View {
    @Environment(\.dismiss) private var dismiss
    @State var roomName: String
    @State var joinCode: String
    @State var memberCount: Int
    @State var memberListModel: [JoinMemberModel]
    
    var body: some View {
        
        VStack(spacing: 21) {
            VStack {
                HStack {
                    CreateRoom_AfterWriteTitleLabelView(roomName: $roomName)
                    Spacer()
                }.padding(.horizontal, -2)
                
                YMJoinCodeStackView(joinCode: joinCode)
                
                Spacer()
            }.padding(.horizontal, 20)
            
            CreateRoom_AfterWriteBottomView(memberCount: $memberCount, memberListModel: $memberListModel)
                .frame(height: 529)
                .cornerRadius(40, corners: [.topLeft, .topRight])
                .shadow(radius: 2)
                .padding(.top, 7)
            
        }
        .padding(.top, 40)
        .background(.gray4)
        
        .ymNavBar(left: {
            Button(action: {
                dismiss()
            }) {
                Image(.icnLeftnarrow)
            }
        })
    }
}

#Preview {
    JoinRoom_Before(roomName: "조교 신영과 훈이들", joinCode: "1asfjqr45", memberCount: 3, memberListModel: [JoinMemberModel(memberName: "신영"), JoinMemberModel(memberName: "민서"), JoinMemberModel(memberName: "여경")])
}
