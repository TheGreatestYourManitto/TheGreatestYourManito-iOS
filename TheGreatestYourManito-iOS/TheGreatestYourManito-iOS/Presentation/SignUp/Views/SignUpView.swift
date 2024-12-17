//
//  SignUpView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 10/23/24.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var prevViewModel: IntroViewModel
    @StateObject var viewModel: SignUpViewModel
    
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
                YMTextField(placeholder: "한글, 영문 7자 이하", text: $viewModel.nickname)
            }
            .padding(.top, 56)
            
            Spacer()
            YMButton(
                title: "확인",
                buttonType: .confirm,
                action: {
                    viewModel.postMakeUser(nickname: viewModel.nickname)
                }
            )
            .padding(.bottom, 20)
            
        }
        .navigationDestination(isPresented: $viewModel.isSuccess) {
            MainView(viewModel: MainViewmodel())
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden()
    }
}
