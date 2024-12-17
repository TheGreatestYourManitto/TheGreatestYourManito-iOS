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
                    .padding(.bottom, 20)
                
                
            }.onAppear {
                viewModel.postUserIdentify()
            }
            .navigationDestination(isPresented: $isPresented) {
                if viewModel.isIdentified {
                    MainView(viewModel: MainViewmodel())
                        .environmentObject(viewModel)
                    
                } else {
                    SignUpView(viewModel: SignUpViewModel())
                        .environmentObject(viewModel)
                }
            }
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden()
        
    }
    
}
