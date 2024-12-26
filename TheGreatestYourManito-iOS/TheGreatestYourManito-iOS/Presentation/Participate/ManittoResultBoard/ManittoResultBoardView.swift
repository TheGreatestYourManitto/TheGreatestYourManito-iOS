//
//  ManittoResultView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 11/9/24.
//

import SwiftUI

struct ManittoResultBoardView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: ManittoResultBoardViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            YMHeaderTagView(
                topDesc: StringLiterals.PlayManittoResultBoard.headerTopDescriptionLabel,
                name: viewModel.manittoName,
                afterNameText: StringLiterals.PlayManittoResultBoard.headerTopDescriptionLabelAfterNameStr
            )
            .padding(.horizontal, 20)
            
            Spacer()
            
            CheerCountBoard(viewModel)
                .padding(.horizontal, 20)
            
            Spacer()
            
            ManittoResultBoardBottomView()
                .environmentObject(viewModel)
                .frame(height: 423)
                .cornerRadius(40, corners: [.topLeft, .topRight])
                .shadow(radius: 10)
        }
        .background(.gray4)
        .ymNavBar(center: {
            Text("\(viewModel.manittoRoomName)")
                .font(.pretendardFont(for: .heading5))
        }, left: {
            Button(action: {
                dismiss()
            }) {
                Image(.icnLeftnarrow)
            }
        })
        .ignoresSafeArea(.container, edges: .bottom)
        .onAppear {
            viewModel.onAppear()
        }
        .onChange(of: viewModel.deleteCompleted) {
            if viewModel.deleteCompleted { dismiss() }
        }
    }
}

private extension ManittoResultBoardView {
    func CheerCountBoard(_ viewModel: ManittoResultBoardViewModel) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            BoardHeader(totalCount: viewModel.totalCheerCount)
            CheerCountList(cheerCount: viewModel.cheerCounts)
        }
    }
    
    func BoardHeader(totalCount: Int) -> some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(StringLiterals.PlayManittoResultBoard.boardHeaderTotalStr) // TODO: Literal 파일 추가시 이동
                    .font(.pretendardFont(for: .heading5))
                    .foregroundStyle(.gray1)
                Text("\(totalCount)\(StringLiterals.PlayManittoResultBoard.boardCountStr)")
                    .font(.pretendardFont(for: .heading5))
                Text(StringLiterals.PlayManittoResultBoard.boardAfterCountStr)
                    .font(.pretendardFont(for: .heading5))
                    .foregroundStyle(.gray1)
            }
            Spacer()
        }
    }
    
    func CheerCountList(cheerCount: [CheerType:Int]) -> some View {
        let columns = [GridItem(.fixed(84)), GridItem(.fixed(84))]
        
        return LazyVGrid(columns: columns, alignment: .leading, spacing: 4) {
            ForEach(CheerType.allCases, id: \.hashValue) { cheer in
                HStack(spacing: 8) {
                    Image(cheer.defaultImage)
                        .resizable()
                        .frame(width: 36, height: 36)
                    
                    Text("\(cheerCount[cheer] ?? 0)\(StringLiterals.PlayManittoResultBoard.boardCountStr)")
                        .font(.pretendardFont(for: .heading6))
                        .foregroundColor(.gray1)
                }
            }
        }
    }
}


