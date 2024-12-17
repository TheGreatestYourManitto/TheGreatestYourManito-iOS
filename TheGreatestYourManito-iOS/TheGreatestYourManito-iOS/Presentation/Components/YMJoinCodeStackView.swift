//
//  YMJoinCodeStackView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/28/24.
//

import SwiftUI

struct YMJoinCodeStackView: View {
    let joinCode: String
    @Binding var isCopyOnClipBoard: Bool
    @Binding var isShowingShareSheet: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                JoinCodeView(joinCode: joinCode)
                
                HStack(spacing: 10) {
                    YMCircleButton(circleBtnType: .copy, action: {
                        isCopyOnClipBoard = true
                        UIPasteboard.general.string = joinCode
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            isCopyOnClipBoard = false
                        }
                    })
                    YMCircleButton(circleBtnType: .share) {
                        isShowingShareSheet = true
                    }
                    .sheet(isPresented: $isShowingShareSheet) {
                        ActivityViewController(activityItems: [joinCode])
                    }
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

struct CopyToastView: View {
    var textTitle: String
    
    var body: some View {
        VStack {
            Text(textTitle)
                .font(.pretendardFont(for: .heading6))
                .foregroundStyle(.gray1)
                .background(.gray3)
        }
        .frame(height: 45)
        .frame(maxWidth: .infinity)
        .background(.gray3)
        .clipShape(.rect(cornerRadius: 16))
        
    }
    
}

//#Preview {
//    YMJoinCodeStackView(joinCode: "asdfghjkl")
//}
