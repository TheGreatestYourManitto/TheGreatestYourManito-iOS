//
//  PlayManittoBottomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

struct PlayManittoBottomView:View {
    
    @State var cheerType: CheerType = .fire
    @State var text: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 24) {
                cheerLabelView()
                buttonStack(cheerType: $cheerType)
                YMTextField(placeholder: "응원메세지 입력", text: $text)
            }
           
            Spacer(minLength: 100)
            
            VStack(spacing: 20) {
                OpenLabelView(dDate: 7)
                YMButton(title: "보내기", buttonType: .confirm, action: {})
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 48)
        .padding(.bottom, 24)
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
        
        @Binding var cheerType: CheerType
        
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

    struct DDayCapsuleLabel: View {
        let leftDayCount: Int
        
        var body: some View {
            Text(leftDayCount == 0 ? "D-Day" : "D-\(leftDayCount)")
                .font(.pretendardFont(for: .heading6))
                .foregroundStyle(.ymPrimary)
                .padding(.horizontal, 19)
                .padding(.vertical, 4)
                .background(.sub2)
                .clipShape(Capsule())
        }
    }
    
    struct OpenLabelView: View {
        var dDate: Int
        
        var body: some View {
            HStack {
                Spacer()
                
                Text("마니또 공개까지")
                    .font(.pretendardFont(for: .heading5))
                    .foregroundStyle(.gray1)
                
                DDayCapsuleLabel(leftDayCount: dDate)
                
                Spacer()
            }
        }
    }
}
