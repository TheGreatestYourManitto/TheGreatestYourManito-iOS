//
//  ManitoButton.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 10/23/24.
//

import SwiftUI

enum YMButtonType {
    case confirm
    case cancel
}

struct YMButton: View {
    var title: String
    var buttonType: YMButtonType
    var isEnabled: Bool = true
    var action: () -> Void

    var body: some View {
        Button(action: {
            if isEnabled {
                action()
            }
        }) {
            Text(title)
                .font(.pretendardFont(for: .heading4))
                .foregroundColor(isEnabled ? textColor : disabledTextColor)
                .padding()
                .frame(height: 64)
                .frame(maxWidth: .infinity)
                .background(isEnabled ? backgroundColor : disabledBackgroundColor)
                .cornerRadius(24)
        }
        .disabled(!isEnabled)
    }

    private var backgroundColor: Color {
        switch buttonType {
        case .confirm:
            return .ymPrimary
        case .cancel:
            return .gray3
        }
    }

    private var textColor: Color {
        switch buttonType {
        case .confirm:
            return .ymWhite
        case .cancel:
            return .gray1
        }
    }

    private var disabledBackgroundColor: Color {
        return .gray3
    }

    private var disabledTextColor: Color {
        return .ymWhite
    }
}

#Preview {
    VStack {
        YMButton(title: "Confirm", buttonType: .confirm, action: {
            print("Confirm Button Tapped")
        })
        .padding()
        YMButton(title: "Confirm", buttonType: .confirm, isEnabled: false, action: {
            print("Confirm Button Tapped")
        })
        .padding()

        YMButton(title: "Cancel", buttonType: .cancel, isEnabled: true, action: {
            print("Cancel Button Tapped")
        })
        .padding()
    }
}
