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
                buttonStack(cheerType: $viewModel.cheerType)
                YMTextField(
                    placeholder: StringLiterals.PlayManitto.bottomSheetTextFieldPlaceholder,
                    text: $viewModel.cheerText
                )
            }
           
            Spacer(minLength: 100)
            
            VStack(spacing: 20) {
                OpenLabelView(status: ManittoEventStatus.getStatus(from: viewModel.manittoEndDate))
                YMButton(title: StringLiterals.PlayManitto.bottomSheetSendButtonStr, buttonType: .confirm, action: {
                    viewModel.tapSendButton()
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
                Text(StringLiterals.PlayManitto.bottomSheetCheerLabel1)
                    .font(.pretendardFont(for: .heading4))
                Text(StringLiterals.PlayManitto.bottomSheetCheerLabel2)
                    .font(.pretendardFont(for: .subtitle1))
            }
        }
    }
}

extension PlayManittoBottomView {
    struct buttonStack: View {
        @Binding var cheerType: CheerType?
        @EnvironmentObject var viewModel: PlayManittoViewModel
        
        var body: some View {
            HStack(spacing: 16) {
                ForEach(CheerType.allCases, id: \.name) { cheerType in
                    Button(action: { viewModel.selectCheerType(cheerType) }) {
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
                Text(StringLiterals.PlayManitto.bottomSheetOpenLabel)
                    .font(.pretendardFont(for: .heading5))
                    .foregroundStyle(.gray1)
                YMDDayLabel(status: status)
                Spacer()
            }
        }
    }
}
