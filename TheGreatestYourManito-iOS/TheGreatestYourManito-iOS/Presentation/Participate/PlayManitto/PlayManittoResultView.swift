//
//  PlayManittoResultView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/31/24.
//

import SwiftUI

struct PlayManittoResultView: View {
    
    @Environment(\.dismiss) private var dismiss
    let todaysCheeringCount: Int
    @State var goNext: Bool = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text(StringLiterals.PlayManittoResult.sendCompleteTitleLabel)
                .font(.pretendardFont(for: .heading1))
                .foregroundStyle(.ymBlack)
                .padding(.top, 100)
            
            Spacer(minLength: 240)
            
            VStack {
                Text(StringLiterals.PlayManittoResult.todaySentCheerLabel)
                    .font(.pretendardFont(for: .heading6))
                    .foregroundStyle(.ymBlack)
                Text("\(todaysCheeringCount)\(StringLiterals.PlayManittoResult.cheerCountStr)")
                    .font(.pretendardFont(for: .heading2))
                    .foregroundStyle(.ymBlack)
            }
            
            Spacer()
            
            YMButton(title: StringLiterals.PlayManittoResult.okayButtonStr, buttonType: .confirm, action: {
                goNext = true
            })
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }
        .navigationDestination(isPresented: $goNext) {
            MainView(viewModel: .init())
        }
    }
}
