//
//  YMSelectableTextField.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 11/27/24.
//

import SwiftUI

struct YMSelectableTextField: View {
    private var isFilled: Bool { !text.isEmpty }
    var placeholder: String
    var text: String
    var backgroundColor: Color = .gray4
    var focusedBorderColor: Color = .ymPrimary
    var unfocusedBorderColor: Color = .gray3
    var action: () -> Void // 탭 시 실행할 액션
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(isFilled ? focusedBorderColor : unfocusedBorderColor, lineWidth: 2)
                )
                .frame(height: 64)
            
            Text(text.isEmpty ? placeholder : text)
                .font(.pretendardFont(for: .heading5))
                .foregroundColor(text.isEmpty ? .gray2 : .ymBlack)
                .padding()
                .frame(height: 64, alignment: .leading)
        }
        .onTapGesture {
            action()
            //            isFocused = true
        }
        .onDisappear {
            //            isFocused = false
        }
    }
}

//#Preview {
//    YMSelectableTextField(
//        placeholder: "Select Date",
//        text: "",
//        action: { print("Tapped!") }
//    )
//    .padding()
//}
