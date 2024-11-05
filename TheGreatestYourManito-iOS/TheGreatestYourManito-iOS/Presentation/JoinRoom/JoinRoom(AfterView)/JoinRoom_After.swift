//
//  JoinRoom_After.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/6/24.
//

import SwiftUI

struct JoinRoom_After: View {
    @Environment(\.dismiss) private var dismiss
    @State var roomName: String
    @State var joinCode: String
    @State var memberCount: Int
    @State var memberListModel: [JoinMemberModel]
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                VStack(spacing: 21) {
                    VStack {
                        HStack {
                            JoinRoom_AfterTitleLabelView(roomName: $roomName)
                            Spacer()
                        }
                        YMJoinCodeStackView(joinCode: joinCode)
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                }
                
                ZStack {
                    JoinRoom_AfterBottomView(memberCount: $memberCount, memberListModel: $memberListModel)
                }
                .cornerRadius(40, corners: [.topLeft, .topRight])
                .shadow(radius: 2)
                .padding(.top, 28)
            }
            
            .ymNavBar(left: {
                Button(action: {
                    dismiss()
                }) {
                    Image(.icnLeftnarrow)
                }
            })
        }
        
    }
}

#Preview {
    JoinRoom_After(roomName: "조교 신영과 훈이들", joinCode: "1asfjqr45", memberCount: 3, memberListModel: [JoinMemberModel(memberName: "신영"), JoinMemberModel(memberName: "민서"), JoinMemberModel(memberName: "여경")])
}
