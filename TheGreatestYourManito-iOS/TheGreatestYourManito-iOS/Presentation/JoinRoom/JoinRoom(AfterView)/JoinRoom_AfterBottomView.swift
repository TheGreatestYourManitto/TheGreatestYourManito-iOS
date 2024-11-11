//
//  JoinRoom_AfterBottomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/6/24.
//

import SwiftUI

struct JoinRoom_AfterBottomView: View {
    
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
        }
        .frame(height: 529)
        .padding(.top, 40)
        .background(.ymWhite)
    }
    
}

extension JoinRoom_AfterBottomView {
    struct MemberCountLabelView: View {
        
        @Binding var memberCount: Int
        
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("총 \(memberCount)명")
                    .font(.pretendardFont(for: .heading4))
                    .foregroundStyle(.ymBlack)
                
                Text(StringLiterals.JoinRoom_After.noticeWordLabel)
                    .font(.pretendardFont(for: .subtitle1))
                    .foregroundStyle(.gray1)
            }
            .padding(.horizontal, 32)
        }
    }
    
}

extension JoinRoom_AfterBottomView {
    struct MemberListView: View {
        @Binding var memberListModel: [JoinMemberModel]
        @Binding var showDeleteSheet: Bool
        
        var body: some View {
            VStack(spacing: 16) {
                ForEach(memberListModel, id: \.memberName) { memberListModel in
                    ZStack {
                        Rectangle()
                            .frame(height: 68, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                        .stroke(.gray3, lineWidth: 1)
                                        .background(.ymWhite))
                        
                        HStack {
                            Text("\(memberListModel.memberName)")
                                .font(.pretendardFont(for: .heading5))
                                .foregroundStyle(.ymBlack)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }
}
