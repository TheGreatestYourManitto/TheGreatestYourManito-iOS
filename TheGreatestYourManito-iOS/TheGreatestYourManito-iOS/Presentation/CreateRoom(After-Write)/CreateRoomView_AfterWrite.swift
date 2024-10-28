//
//  CreateRoomView_AfterWrite.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/28/24.
//

import SwiftUI

struct CreateRoomView_AfterWrite: View {
    @State var roomName: String
    @State var joinCode: String
    
    var body: some View {
        VStack(spacing: 21) {
            HStack {
                CreateRoom_AfterWriteTitleView(roomName: $roomName)
                Spacer()
            }.padding(.horizontal, -2)
            
            YMJoinCodeStackView(joinCode: $joinCode)
            
            
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal, 20)
        .background(.gray4)
        
    }
}

extension CreateRoomView_AfterWrite {
    
    
    
}

#Preview {
    CreateRoomView_AfterWrite(roomName: "ㄴㄴㄴ", joinCode: "~~~~~~~~~")
}
