//
//  MainView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 10/27/24.
//

import SwiftUI

struct MainView: View {
    @State private var isRefreshing = false
    @State private var isCreateBtnTap: Bool = false
    @StateObject var viewModel: MainViewmodel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Image(.icnSmallLogo)
                    Spacer()
                    Image(.icnSetting)
                }
                .padding(.top, 24)
                .padding(.horizontal, 16)
                
                HStack(spacing: 16) {
                    Button(action: {
                        isCreateBtnTap = true
                    }) {   // 방 만들기
                        Image(.icnPlusCircle)
                        Text("방 만들기")
                            .padding(.leading, 8)
                            .font(.pretendardFont(for: .heading5))
                            .foregroundColor(.ymBlack)
                    }
                    .frame(height: 64)
                    .frame(maxWidth: .infinity)
                    .background(.sub2)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    Button(action: { }) {   // 방 입장하기
                        Image(.icnCheckCircle)
                        Text("방 입장하기")
                            .padding(.leading, 8)
                            .font(.pretendardFont(for: .heading5))
                            .foregroundColor(.ymBlack)
                    }
                    .frame(height: 64)
                    .frame(maxWidth: .infinity)
                    .background(.gray4)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.top, 40)
                .padding(.horizontal, 16)
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray4).ignoresSafeArea(edges: .bottom)
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(viewModel.rooms, id: \.roomId) { room in
                                RoomCardView(roomName: room.roomName, dDay: Date.calculateDDay(from: room.endDate) ?? 0)
                            }
                        }
                        .padding(.top, 30)
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.top, 24)
            }
            .background(Color.ymWhite)
            .onAppear {
                viewModel.getFindRoomList()
            }
            .navigationDestination(isPresented: $isCreateBtnTap) {
                CreateRoomView(viewModel: CreateRoomViewModel())
            }
        }
    }
}

//#Preview {
//    MainView()
//}
