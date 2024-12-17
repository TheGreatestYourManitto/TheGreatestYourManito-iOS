//
//  YMTextField.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 10/23/24.
//

import SwiftUI

struct YMTextField: View {
    //    @State private var isFocused = false
    private var isFilled: Bool { !text.wrappedValue.isEmpty }
    var placeholder: String
    var text: Binding<String>
    var backgroundColor: Color = .gray4
    var focusedBorderColor: Color = .ymPrimary
    var unfocusedBorderColor: Color = .gray3
    
    var body: some View {
        TextField(placeholder, text: text)
            .font(.pretendardFont(for: .heading5))
            .padding()
            .frame(height: 64)
            .background(backgroundColor)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isFilled ? focusedBorderColor : unfocusedBorderColor, lineWidth: 2)
            )
    }
}

#Preview {
    YMTextField(placeholder: "Enter text", text: .constant(""), backgroundColor: .gray4)
        .padding()
}
