//
//  AfterCreateRoomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 11/28/24.
//

//TODO: - d-day 세팅해야함

import SwiftUI

struct AfterCreateRoomView: View {
    
    @EnvironmentObject var viewModel: CreateRoomViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image(.icnBigCancle)
            }
            
            Text("마니또 공개까지\nD-7 남았어요!")
                .padding(.top, 36)
                .font(.pretendardFont(for: .heading1))
            
            HStack {
                Text("방 참여 코드")
                    .font(.pretendardFont(for: .heading4))
                
                Text("복사해서 공유해보세요!")
                    .font(.pretendardFont(for: .subtitle1))
                    .foregroundStyle(.gray1)
            }
            .padding(.top, 60)
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray3, lineWidth: 1)
                    .background(.ymWhite)
                    .frame(height: 68)
                
                HStack {
                    Text(viewModel.joinCode)
                        .font(.pretendardFont(for: .heading5))
                        .foregroundStyle(.ymBlack)
                    Spacer()
                    Image(.icnClipboardCircle)
                    }
                .padding(.horizontal, 20)
                }
            Spacer()
            YMButton(title: "공유하기", buttonType: .confirm, action: {})
        }
        
        .padding(.horizontal, 24)
    
    }
}

//#Preview {
//    AfterCreateRoomView(joinCode: .constant("ABCD1234"))
//}
