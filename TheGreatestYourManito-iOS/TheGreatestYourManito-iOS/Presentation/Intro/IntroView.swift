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
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(.clover)
                    .frame(maxHeight: .infinity)
                
                Spacer()
                
                YMButton(title: "시작하기", buttonType: .confirm, action: {isPresented = true})
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
            }
            .onAppear {
                viewModel.postUserIdentify()
            }
            .overlay(
                Group {
                    if viewModel.isLoading {
                        YMLoadingView(titleText: "로그인 중 입니다...")
                            .ignoresSafeArea(.all)
                    }
                    
                    if viewModel.toastOccurred {
                        VStack {
                            Spacer()
                            CopyToastView(textTitle: viewModel.toastText)
                                .padding(.bottom, 140)
                                .padding(.horizontal, 16)
                        }
                    }
                }
            )
            .navigationDestination(isPresented: $isPresented) {
                if viewModel.isIdentified ?? false {
                    MainView(viewModel: MainViewmodel())
                        .environmentObject(viewModel)
                } else {
                    SignUpView(viewModel: SignUpViewModel())
                        .environmentObject(viewModel)
                }
            }
        }
        .navigationBarBackButtonHidden()
        
    }
    
}
