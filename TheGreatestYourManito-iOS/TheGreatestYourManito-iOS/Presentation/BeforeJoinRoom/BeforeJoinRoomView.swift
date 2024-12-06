//
//  BeforeJoinRoomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/6/24.
//

import SwiftUI

struct BeforeJoinRoomView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: JoinRoomViewModel
    
    var body: some View {
            ZStack(alignment: .top) {
                VStack(spacing: 32) {
                    headerView
                    bottomView
                        .frame(height: 495)
                        .background(.ymWhite)
                        .cornerRadius(40, corners: [.topLeft, .topRight])
                        .shadow(radius: 2)
                }
                .ymNavBar(left: {
                    Button(action: { dismiss() }) {
                        Image(.icnLeftnarrow)
                    }
                })
                
            }.edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden()
        .overlay(
            Group {
                if viewModel.isLoading {
                    YMLoadingView(titleText: "방 만드는 중..")
                        .edgesIgnoringSafeArea(.all)
                }
            }
        )
        
        
    }
    
    private var headerView: some View {
        VStack(spacing: 21) {
            VStack(spacing: 16) {
                HStack {
                    Text(StringLiterals.BeforeJoinRoom.titleLabel)
                        .font(.pretendardFont(for: .heading2))
                        .foregroundColor(.ymBlack)
                    Spacer()
                }
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(StringLiterals.BeforeJoinRoom.subTitleLabel1)
                            .font(.pretendardFont(for: .heading6))
                            .foregroundColor(.gray1)
                        Text(StringLiterals.BeforeJoinRoom.subTitleLabel2)
                            .font(.pretendardFont(for: .heading6))
                            .foregroundColor(.gray1)
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var bottomView: some View {
        BeforeJoinRoomBottomView()
            .environmentObject(viewModel)
    }
    
}
