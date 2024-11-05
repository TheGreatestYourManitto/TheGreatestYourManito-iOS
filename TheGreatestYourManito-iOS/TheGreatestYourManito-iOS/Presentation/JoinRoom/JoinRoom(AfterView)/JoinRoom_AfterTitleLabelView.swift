//
//  JoinRoom_AfterTitleLabelView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/6/24.
//

import SwiftUI

struct JoinRoom_AfterTitleLabelView: View {
    @Binding var roomName: String
    
    var body: some View {
        VStack {
            Text(roomName)
                .font(.pretendardFont(for: .heading2))
                .foregroundStyle(.ymBlack)
        }
    }
}
