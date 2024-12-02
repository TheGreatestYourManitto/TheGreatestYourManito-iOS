//
//  CreateRoomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 11/27/24.
//


import SwiftUI

struct CreateRoomView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: CreateRoomViewModel
    @State private var isDatePickerPresented: Bool = false
    @State private var isTimePickerPresented: Bool = false
    @State private var toastMessage: String? = nil
    @State private var isSuccessCreateRoom: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(.gray4)
                    .edgesIgnoringSafeArea(.top)
                VStack(spacing: 32) {
                    headerView
                    contentView
                        .frame(maxHeight: .infinity)
                        .background(.ymWhite)
                        .cornerRadius(40, corners: [.topLeft, .topRight])
                        .shadow(radius: 2)
                }
                .ymNavBar(left: {
                    Button(action: { dismiss() }) {
                        Image(.icnLeftnarrow)
                    }
                })
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .sheet(isPresented: $isDatePickerPresented) {
            VStack {
                DatePicker(
                    "종료 날짜 선택",
                    selection: Binding(
                        get: { viewModel.selectedDate ?? Date() },
                        set: { viewModel.selectedDate = $0 }
                    ),
                    displayedComponents: .date
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                
                
                YMButton(title: "확인", buttonType: .confirm, action: { isDatePickerPresented = false
                })
                .padding(.horizontal, 16)
            }
            .presentationDetents([.fraction(0.6)])
        }
        .sheet(isPresented: $isTimePickerPresented) {
            VStack {
                DatePicker(
                    "",
                    selection: Binding(
                        get: { viewModel.selectedTime ?? Date() },
                        set: { viewModel.selectedTime = $0 }
                    ),
                    displayedComponents: .hourAndMinute
                )
                .datePickerStyle(WheelDatePickerStyle())
                YMButton(title: "확인", buttonType: .confirm, action: { isTimePickerPresented = false
                })
                .padding(.horizontal, 16)
            }
            .presentationDetents([.fraction(0.4)])
        }
        .navigationDestination(isPresented: $isSuccessCreateRoom) {
            // AfterCreateRoomView로 넘어가는 코드
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 16) {
            HStack {
                Text(StringLiterals.CreateRoom.titleLabel)
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
        .padding(.top, 20)
    }
    
    private var contentView: some View {
        
        VStack(alignment: .leading, spacing: 40) {
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 8) {
                    Text(StringLiterals.CreateRoom.RoomNameTitleLabel)
                        .font(.pretendardFont(for: .heading4))
                        .foregroundColor(.ymBlack)
                    
                    Text(StringLiterals.CreateRoom.RoomNameSubTitleLabel)
                        .font(.pretendardFont(for: .subtitle1))
                        .foregroundColor(.gray1)
                    
                }
                YMTextField(placeholder: StringLiterals.CreateRoom.RoomNamePlaceholder, text: $viewModel.roomName)
                
            }
            
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing:8) {
                    Text(StringLiterals.CreateRoom.EndDateTitleLabel)
                        .font(.pretendardFont(for: .heading4))
                        .foregroundColor(.ymBlack)
                    Text(StringLiterals.CreateRoom.EndDateSubTitleLabel)
                        .font(.pretendardFont(for: .subtitle1))
                        .foregroundColor(.gray1)
                }
                HStack(spacing: 12) {
                    YMSelectableTextField(
                        placeholder: "종료 날짜",
                        text: viewModel.selectedDate != nil ? formatDate(viewModel.selectedDate!) : "",
                        action: {
                            print("종료 날짜 선택")
                            isDatePickerPresented = true
                        }
                    )
                    
                    
                    YMSelectableTextField(
                        placeholder: "종료 시간",
                        text: viewModel.selectedTime != nil ? formatTime(viewModel.selectedTime!) : "",
                        action: {
                            print("종료 시간 선택")
                            isTimePickerPresented = true
                        }
                    )
                }
                Spacer()
                YMButton(
                    title: "확인",
                    buttonType: .confirm,
                    action: {
                        viewModel.postMakeRoom {
                            isSuccessCreateRoom = true
                        }
                    }
                )
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.top, 48)
    }
    
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
}
