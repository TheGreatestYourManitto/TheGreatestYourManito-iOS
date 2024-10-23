//
//  SignUpView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 10/23/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var nickname: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("닉네임을 입력하세요")
                .font(.pretendardFont(for: .heading2))
                .padding(.top, 100)
            VStack(alignment: .leading){
                Text("닉네임")
                    .font(.pretendardFont(for: .subtitle1))
                    .foregroundStyle(.gray1)
                    .padding(.leading, 7)
                YMTextField(placeholder: "한글, 영문 7자 이하", text: $nickname)
            }
            .padding(.top, 56)
            
            Spacer()
            YMButton(title: "확인", buttonType: .confirm, action: {print("닉네임: \(nickname)")})
                .padding(.bottom, 20)
            
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    SignUpView()
}
