//
//  CreateRoom_AfterWriteBottomView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/28/24.
//

import SwiftUI

struct CreateRoom_AfterWriteBottomView: View {
    @Binding var text: String
    var body: some View {
        VStack {
                    VStack(alignment: .leading, spacing: 24) {
                        YMTextField(placeholder: "응원메세지 입력", text: $text)
                    }

                    Spacer(minLength: 100)

                    VStack(spacing: 20) {
                        YMButton(title: "보내기", buttonType: .confirm, action: {})
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 48)
                .padding(.bottom, 54)
                .background(.ymWhite)
    }
}
