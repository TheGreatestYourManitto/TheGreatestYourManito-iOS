//
//  ManittoResultBoardBottomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 11/9/24.
//

import SwiftUI

struct ManittoResultBoardBottomView: View {
    var body: some View {
        
        ZStack(alignment: .top) {
            BottomView()
            VStack {
                Spacer()
                YMButton(
                    title: "목록에서 삭제하기",
                    buttonType: .confirm,
                    action: { print("뿅") }
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
    func BottomView() -> some View {
        VStack {
            
            YMCapsuleLabel(
                text: "최고의 마니또 순위", // TODO: Literal
                backgroundColor: .sub2,
                foregroundColor: .ymPrimary
            )
            .padding(.vertical, 20)
            
            VStack(spacing: 20) {
                ManittoRankListItem(
                    rank: .first,
                    personFrom: "test",
                    personTo: "test1",
                    cheerCount: 0
                )
                ManittoRankListItem(
                    rank: .second,
                    personFrom: "test2",
                    personTo: "test1",
                    cheerCount: 0
                )
                ManittoRankListItem(
                    rank: .third,
                    personFrom: "test3",
                    personTo: "test1",
                    cheerCount: 0
                )
                ManittoRankListItem(
                    rank: .other(num: 4),
                    personFrom: "test4",
                    personTo: "test1",
                    cheerCount: 0
                )
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
