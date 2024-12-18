//
//  AfterCreateRoomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 11/28/24.
//


import SwiftUI

struct AfterCreateRoomView: View {
    
    @EnvironmentObject var viewModel: CreateRoomViewModel
    @Environment(\.dismiss) var dismiss
    @State var isPresented: Bool = false
    @State var isCopyOnClipBoard: Bool
    @State var goNext: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button(action: {
                    goNext = true
                }, label: {
                    Image(.icnBigCancle)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                })
                
            }
            
            Text("마니또 공개까지\nD-\(viewModel.dDay) 남았어요!")
                .padding(.top, 36)
                .font(.pretendardFont(for: .heading1))
            
            HStack {
                Text("방 참여 코드")
                    .font(.pretendardFont(for: .heading4))
                
                Text("복사해서 공유해보세요!")
                    .font(.pretendardFont(for: .subtitle1))
                    .foregroundStyle(.gray1)
            }
            .padding(.top, 60)
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray3, lineWidth: 1)
                    .background(.ymWhite)
                    .frame(height: 68)
                
                HStack {
                    Text(viewModel.joinCode)
                        .font(.pretendardFont(for: .heading5))
                        .foregroundStyle(.ymBlack)
                    Spacer()
                    Button(action: {
                        copyToClipboard()
                        print(isCopyOnClipBoard)
                    }) {
                        Image(.icnClipboardCircle)
                    }
                }
                .padding(.horizontal, 20)
            }
            Spacer()
            VStack(spacing: 16) {
                
                YMButton(title: "공유하기", buttonType: .confirm, action: {
                    isPresented = true
                })
                .sheet(isPresented: $isPresented) {
                    ActivityViewController(activityItems: [viewModel.joinCode])
                }
            }
            .overlay(
                Group {
                    if isCopyOnClipBoard {
                        VStack {
                            Spacer()
                            CopyToastView(textTitle: StringLiterals.JoinRoomPublic.copyComent)
                                .padding(.bottom, 140)
                                .padding(.horizontal, 16)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                    }
                }
            )
            .animation(.easeOut(duration: 0.3), value: isCopyOnClipBoard)
        }
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $goNext) {
            MainView(viewModel: .init())
        }
    }
    
    private func copyToClipboard() {
        UIPasteboard.general.string = viewModel.joinCode
        isCopyOnClipBoard = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isCopyOnClipBoard = false
        }
        print(isCopyOnClipBoard)
    }
    func dismissPrev(handler: @escaping ()-> ()) {
        DispatchQueue.main.async {
            handler()
        }
    }
}
