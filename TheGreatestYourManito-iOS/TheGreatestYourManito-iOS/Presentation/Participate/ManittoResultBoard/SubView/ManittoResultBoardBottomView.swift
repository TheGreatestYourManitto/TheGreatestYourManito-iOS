//
//  ManittoResultBoardBottomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 11/9/24.
//

import SwiftUI

struct ManittoResultBoardBottomView: View {
    var viewModel: ManittoResultBoardViewModel
    
    init(_ viewModel: ManittoResultBoardViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            BottomView(manittoRankList: viewModel.manittoRankList)
            VStack {
                Spacer()
                YMButton(
                    title: "목록에서 삭제하기",
                    buttonType: .confirm,
                    action: { viewModel.tapDeleteButton() }
                )
                .padding(.bottom, 24)
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 54)
        .background(.ymWhite)
    }
}

private extension ManittoResultBoardBottomView {
    func BottomView(manittoRankList: ManittoRankList) -> some View {
        VStack {
            
            YMCapsuleLabel(
                text: "최고의 마니또 순위", // TODO: Literal
                backgroundColor: .sub2,
                foregroundColor: .ymPrimary
            )
            .padding(.vertical, 20)
            
            VStack(spacing: 20) {
                ForEach(Array(manittoRankList.enumerated()), id: \.offset) { (index, rank) in
                    ManittoRankListItem(
                        rank: rank.rank,
                        personFrom: rank.fromPerson.name,
                        personTo: rank.toPerson.name,
                        cheerCount: rank.cheerCount
                    )
                }
            }
        }
    }
}

private extension ManittoResultBoardBottomView {
    func ManittoRankListItem(rank: ManiitoRank, personFrom: String, personTo: String, cheerCount: Int) -> some View {
        HStack(spacing: 0) {
            HStack(spacing: 10) {
                rank.MedalView
                ManittoRelationText(personFrom, personTo)
            }
            Spacer()
            Text("\(cheerCount)번") // TODO: Literal
                .font(.pretendardFont(for: .subtitle1))
                .foregroundStyle(.gray1)
            Spacer()
        }
    }
    
    func ManittoRelationText(_ personFrom: String, _ personTo: String) -> some View {
        HStack(spacing: 8) {
            Text(personFrom)
                .font(.pretendardFont(for: .heading4))
            Image(systemName: "arrow.right")
                .renderingMode(.template)
                .foregroundStyle(.gray1)
                .frame(width: 18, height: 18)
            Text(personTo)
                .font(.pretendardFont(for: .heading4))
                .foregroundStyle(.gray1)
        }
    }
}
