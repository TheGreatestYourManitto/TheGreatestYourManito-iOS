//
//  ManittoResultView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 11/9/24.
//

import SwiftUI

struct ManittoResultBoardView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            YMHeaderTagView(
                topDesc: "나를 응원해 준 마니또는",
                name: "이자민",
                afterNameText: "!"
            )
            .padding(.horizontal, 20)
            
            Spacer()
            
            CheerCountBoard()
                .padding(.horizontal, 20)
            
            Spacer()
            
            ManittoResultBoardBottomView()
                .frame(height: 423)
                .cornerRadius(40, corners: [.topLeft, .topRight])
                .shadow(radius: 10)
        }
        .background(.gray4)
        .ymNavBar(center: {
            Text("\(String.Type.self)")
                .font(.pretendardFont(for: .heading5))
        }, left: {
            Button(action: {
                dismiss()
            }) {
                Image(.icnLeftnarrow)
            }
        })
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

private extension ManittoResultBoardView {
    func CheerCountBoard() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            BoardHeader()
            CheerCountList(cheerCount: [ .fire: 10, .love: 20, .luck: 30, .gift: 40])
        }
    }
    
    func BoardHeader() -> some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("총 ") // TODO: Literal 파일 추가시 이동
                    .font(.pretendardFont(for: .heading5))
                    .foregroundStyle(.gray1)
                Text("\(Int.Type.self)번")
                    .font(.pretendardFont(for: .heading5))
                Text("의 응원을 받았어요!")
                    .font(.pretendardFont(for: .heading5))
                    .foregroundStyle(.gray1)
            }
            Spacer()
            Button(action: {}, label: {
                Text("자세히 보기") // TODO: Literal 파일 추가시 이동
                    .font(.pretendardFont(for: .heading6))
                    .foregroundStyle(.gray1)
                    .padding(.horizontal, 13)
                    .padding(.vertical, 8)
                    .background(Color.gray3)
                    .clipShape(.rect(cornerRadius: 16))
            })
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
                    
                    Text("\(cheerCount[cheer] ?? 0)번") // TODO: Literal 추가
                        .font(.pretendardFont(for: .heading6))
                        .foregroundColor(.gray1)
                }
            }
        }
    }
}


