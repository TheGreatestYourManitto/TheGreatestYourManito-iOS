//
//  CreateRoom_AfterWriteTitleLabelView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/28/24.
//

import SwiftUI

struct CreateRoom_AfterWriteTitleLabelView: View {
    @Binding var roomName: String
    
    var body: some View {
        VStack {
            Text(roomName)
                .font(.pretendardFont(for: .heading2))
                .foregroundStyle(.ymBlack)
        }
    }
}
