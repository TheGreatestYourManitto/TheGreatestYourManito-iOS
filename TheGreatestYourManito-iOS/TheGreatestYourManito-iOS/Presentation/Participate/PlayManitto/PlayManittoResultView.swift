//
//  PlayManittoResultView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/31/24.
//

import SwiftUI

struct PlayManittoResultView: View {
    
    let todaysCheeringCount: Int
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("전송 완료!") // TODO: Literal 파일 추가시 이동
                .font(.pretendardFont(for: .heading1))
                .foregroundStyle(.ymBlack)
                .padding(.top, 100)
            
            Spacer(minLength: 240)
            
            VStack {
                Text("오늘 보낸 응원") // TODO: Literal 파일 추가시 이동
                    .font(.pretendardFont(for: .heading6))
                    .foregroundStyle(.ymBlack)
                Text("\(todaysCheeringCount)회") // TODO: Literal 파일 추가시 이동
                    .font(.pretendardFont(for: .heading2))
                    .foregroundStyle(.ymBlack)
            }
            
            Spacer()
            
            YMButton(title: "확인", buttonType: .confirm, action: {
                print("가라 집으로")
            })
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }
    }
}
