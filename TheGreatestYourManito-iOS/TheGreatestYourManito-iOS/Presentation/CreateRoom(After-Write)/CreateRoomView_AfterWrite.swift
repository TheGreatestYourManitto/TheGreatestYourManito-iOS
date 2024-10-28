//
//  CreateRoomView_AfterWrite.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/28/24.
//

import SwiftUI

struct CreateRoomView_AfterWrite: View {
    @State var text: String
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
            
            
            CreateRoom_AfterWriteBottomView(text: $text)
                .frame(height: 529)
            //                .cornerRadius(20, corners: [.topLeft, .topRight])
                .shadow(radius: 10)
                .padding(.top, 7)
            
        }
        .padding(.top, 40)
        .padding(.horizontal, 20)
        .background(.gray4)
        
        
        
    }
}

#Preview {
    CreateRoomView_AfterWrite(text: "tqeqwx", roomName: "ㄴㄴㄴ", joinCode: "~~~~~~~~~")
}
