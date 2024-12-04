//
//  IntroView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 10/23/24.
//

import SwiftUI

struct IntroView: View {
    @State private var tag:Int? = nil
    @StateObject var viewModel: IntroViewModel
    private let loadingState = AppStates.shared
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(.clover)
                    .frame(maxHeight: .infinity)
                
                Spacer()
                
                NavigationLink(
                    destination:
                        // isIdentified가 true면 이미 등록된 기기
                    // 따라서 true인 곳에 CreateRoom 붙이면 됨!
                    viewModel.isIdentified ?  SignUpView(viewModel: SignUpViewModel()) : SignUpView(viewModel: SignUpViewModel()),
                    tag: 1,
                    selection: self.$tag
                ) {
                    YMButton(title: "시작하기", buttonType: .confirm, action: {self.tag = 1})
                        .padding(.bottom, 20)
                }
                               .onAppear {
                                   viewModel.postUserIdentify()
                               }
            }
            
        }
        .padding(.horizontal, 16)
        .overlay(
            Group {
                if loadingState.isLoading {
                    YMLoadingView(titleText: "로딩중 ...")
                        .onAppear(perform: {
                            print("!~~~!@!@!@")
                        })
                }
            }
        )
    }
}
