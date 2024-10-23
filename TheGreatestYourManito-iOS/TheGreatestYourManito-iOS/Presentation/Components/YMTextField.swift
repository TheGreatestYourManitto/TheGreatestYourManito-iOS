//
//  YMTextField.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 10/23/24.
//

import SwiftUI

struct YMTextField: View {
    @State private var isFocused = false
    var placeholder: String
    var text: Binding<String>
    var backgroundColor: Color = .gray4
    var focusedBorderColor: Color = .ymPrimary
    var unfocusedBorderColor: Color = .gray3

    var body: some View {
        TextField(placeholder, text: text)
            .font(.pretendardFont(for: .heading5))
            .padding()
            .background(backgroundColor)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isFocused ? focusedBorderColor : unfocusedBorderColor, lineWidth: 2)
            )
            .onTapGesture {
                isFocused = true
            }
            .onChange(of: text.wrappedValue) {
                isFocused = true
            }
            .onDisappear {
                isFocused = false
            }
    }
}

#Preview {
    YMTextField(placeholder: "Enter text", text: .constant(""), backgroundColor: .gray4)
        .padding()
}
