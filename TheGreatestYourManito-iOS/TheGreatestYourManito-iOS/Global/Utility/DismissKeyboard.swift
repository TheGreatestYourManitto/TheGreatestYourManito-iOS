//
//  DismissKeyboard.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 12/18/24.
//

import SwiftUI

private struct KeyboardDismissKey: EnvironmentKey {
    static let defaultValue: () -> Void = {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
}

extension EnvironmentValues {
    var dismissKeyboard: () -> Void {
        self[KeyboardDismissKey.self]
    }
}

struct DismissKeyboardModifier: ViewModifier {
    @Environment(\.dismissKeyboard) private var dismissKeyboard
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                dismissKeyboard()
            }
            .gesture(
                DragGesture()
                    .onChanged { _ in
                        dismissKeyboard()
                    }
            )
    }
}
