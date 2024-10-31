//
//  PlayManittoBottomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

struct PlayManittoBottomView: View {
    
    @EnvironmentObject var viewModel: PlayManittoViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 24) {
                cheerLabelView()
                buttonStack(cheerType: Binding(get: { viewModel.cheerType }, set: { viewModel.performAction(.tapCheerItem($0))}))
                YMTextField(
                    placeholder: "응원메세지 입력",
                    text: Binding(get: { viewModel.cheerText }, set: { viewModel.performAction(.typeCheerText($0))})
                )
            }
           
            Spacer(minLength: 100)
            
            VStack(spacing: 20) {
                OpenLabelView(status: .ongoing(dDay: 7))
                YMButton(title: "보내기", buttonType: .confirm, action: {
                    viewModel.performAction(.tapSendButton)
                })
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 48)
        .padding(.bottom, 54)
        .background(.ymWhite)
    }
}

extension PlayManittoBottomView {
    struct cheerLabelView: View {
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("응원 보내기!")
                    .font(.pretendardFont(for: .heading4))
                Text("아이콘을 선택하면 추천 멘트가 뜨고, 수정도 가능해요.")
                    .font(.pretendardFont(for: .subtitle1))
            }
        }
    }
}

extension PlayManittoBottomView {
    struct buttonStack: View {
        @Binding var cheerType: CheerType?
        
        var body: some View {
            HStack(spacing: 16) {
                ForEach(CheerType.allCases, id: \.name) { cheerType in
                    Button(action: { self.cheerType = cheerType }) {
                        Image(self.cheerType == cheerType ? cheerType.clickedImage: cheerType.defaultImage)
                    }
                }
            }
        }
    }
}

extension PlayManittoBottomView {
    struct OpenLabelView: View {
        let status: ManittoEventStatus
        
        var body: some View {
            HStack {
                Spacer()
                Text("마니또 공개까지")
                    .font(.pretendardFont(for: .heading5))
                    .foregroundStyle(.gray1)
                YMDDayLabel(status: status)
                Spacer()
            }
        }
    }
}