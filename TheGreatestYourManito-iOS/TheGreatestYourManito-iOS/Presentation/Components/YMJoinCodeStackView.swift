//
//  YMJoinCodeStackView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/28/24.
//

import SwiftUI

struct YMJoinCodeStackView: View {
    let joinCode: String
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                JoinCodeView(joinCode: joinCode)
                
                HStack(spacing: 10) {
                    YMCircleButton(circleBtnType: .copy, action: {})
                    YMCircleButton(circleBtnType: .share, action: {})
                }
            }
        }
    }
}

extension YMJoinCodeStackView {
    
    struct JoinCodeView: View {
        let joinCode: String
        
        var body: some View {
            HStack {
                Text(joinCode)
                    .font(.pretendardFont(for: .heading6))
                    .foregroundStyle(.gray1)
                    .background(.ymWhite)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(.ymWhite)
            .clipShape(.rect(cornerRadius: 16))
        }
    }
    
}

//#Preview {
//    YMJoinCodeStackView(joinCode: "asdfghjkl")
//}
