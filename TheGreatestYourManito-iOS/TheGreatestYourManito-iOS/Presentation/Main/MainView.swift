//
//  MainView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 10/27/24.
//

import SwiftUI

extension MainView {
    enum PresentScreen {
        case none
        case BeforeJoinRoomView
        case CreateRoomView
        case OpenManitoView
        case BeforeJoinRoomViewActivated
    }
}

struct MainView: View {
    
    @State private var isRefreshing = false
//    @State private var isCreateBtnTap: Bool = false
//    @State private var isJoinBtnTap: Bool = false
//    @State private var isRoomTap: Bool = false
    @State private var presentView: Bool = false
    @State private var presentScreen: PresentScreen = .none
    
    @StateObject var viewModel: MainViewmodel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(.icnSmallLogo)
                Spacer()
            }
            .padding(.top, 24)
            .padding(.horizontal, 16)
            
            HStack(spacing: 16) {
                Button(action: {
                    presentScreen = .CreateRoomView
//                    isCreateBtnTap = true
                    viewModel.isPresented = true
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
                
                Button(action: {
//                    isCreateBtnTap = true
//                    isJoinBtnTap = true
                    presentScreen = .BeforeJoinRoomView
                    viewModel.isPresented = true
                }) {   // 방 입장하기
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
                
                if !viewModel.rooms.isEmpty {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(viewModel.rooms, id: \.roomId) { room in
                                RoomCardView(
                                    roomName: room.roomName,
                                    dDay: Date.calculateDDay(from: room.endDate) ?? 0,
                                    onTap: {
                                        handleRoomSelection(room)
                                    }
                                )
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.top, 30)
                    .padding(.horizontal, 16)
                } else {
                    VStack(spacing: 30) {
                        Spacer()
                        HStack(spacing: 16) {
                            ForEach(CheerType.allCases.indices, id: \.self) { index in
                                Image(CheerType.allCases[index].defaultImage)
                            }
                        }
                        Text("참여중인 방이 없어요!")
                            .font(.pretendardFont(for: .heading4))
                            .foregroundColor(.purple)
                        Spacer()
                        Spacer()
                    }
                }
            }
            .padding(.top, 24)
        }
        .background(Color.ymWhite)
        .onAppear {
            viewModel.getFindRoomList()
        }
        .navigationDestination(isPresented: $viewModel.isPresented) {
            switch presentScreen {
            case .BeforeJoinRoomView:
                BeforeJoinRoomView(viewModel: JoinRoomViewModel(roomType: .notOwner))
            case .CreateRoomView:
                CreateRoomView(viewModel: CreateRoomViewModel(), presentThis: $viewModel.isPresented)
            case .OpenManitoView:
                OpenManitoView(manitoResultType: .notOpen, viewModel: OpenMaintoViewModel(room: viewModel.selectRoom))
                    .navigationBarBackButtonHidden()
            case .BeforeJoinRoomViewActivated:
                let viewModel = JoinRoomViewModel(roomType: viewModel.roomType, joinCode: viewModel.joinCode, roomName: viewModel.roomName, memberCount: viewModel.memberCount, memberListModel: viewModel.memberListModel, roomId: viewModel.roomId)
                AfterJoinRoomView()
                    .environmentObject(viewModel)
            default:
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func handleRoomSelection(_ room: Room) {
        print("Selected room: \(room.roomName), ID: \(room.roomId)")
        viewModel.isConfirmed = room.isConfirmed
        viewModel.roomId = room.roomId
        if viewModel.isConfirmed == 0 {
            viewModel.getRoomInfoInMainView(roomId: room.roomId)
            presentScreen = .BeforeJoinRoomViewActivated
        } else {
            print("🔥🔥🔥")
            viewModel.selectRoom = room
            presentScreen = .OpenManitoView
            viewModel.isPresented = true
        }
        
    }
    
}
