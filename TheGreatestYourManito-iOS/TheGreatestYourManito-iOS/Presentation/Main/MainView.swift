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
    @State private var isRoomTap: Bool = false
    @State private var isPresented:Bool = false
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
                        isPresented = true
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
                                RoomCardView(
                                    roomName: room.roomName,
                                    dDay: Date.calculateDDay(from: room.endDate) ?? 0,
                                    onTap: {
                                        isRoomTap = true
                                        handleRoomSelection(room)
                                    }
                                )
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
            .navigationDestination(isPresented: $isPresented) {
                if isCreateBtnTap {
                    CreateRoomView(viewModel: CreateRoomViewModel())
                } else {
                    if viewModel.isConfirmed == 1 {
                        OpenManitoView(manitoResultType: .notOpen, viewModel: OpenMaintoViewModel(roomId: viewModel.roomId))
                    } else { // 시작되지 않았다면
                        if viewModel.isTapRoom { // 해당 변수로 통제하지않으면,viewModel.getRoomInfoInMainView(roomId: viewModel.roomId)로 값이 세팅되기 이전 BeforeJoinRoomView로 이동해버림
                            BeforeJoinRoomView(viewModel: JoinRoomViewModel(roomType: viewModel.roomType, joinCode: viewModel.joinCode, roomName: viewModel.roomName, memberCount: viewModel.memberCount, memberListModel: viewModel.memberListModel)
                            )
                        }
                    }
                }
                
            }
        }
    }
    
    func handleRoomSelection(_ room: Room) {
        print("Selected room: \(room.roomName), ID: \(room.roomId)")
        viewModel.isConfirmed = room.isConfirmed
        viewModel.roomId = room.roomId
        if viewModel.isConfirmed == 0 {
            viewModel.getRoomInfoInMainView(roomId: viewModel.roomId)
        }
        print("아아아아아",viewModel.roomName)
        isPresented = true
    }
    
}
