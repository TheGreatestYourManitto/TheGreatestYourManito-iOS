//
//  YMBottomSheet.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/31/24.
//

import SwiftUI

public enum YMBottomSheetType {
    case dragBar
    case nonDragBar
}

public struct YMBottomSheetModifier<V>: ViewModifier where V: View {
    
    @Binding private var showSheet: Bool
    var bottomSheetType: YMBottomSheetType
    
    let contentView: (() -> V)
    let backgroundColor: Color
    let sheetHeight: CGFloat
    
    public init(
        contentView: @escaping (() -> V),
        showSheet: Binding<Bool>,
        sheetHeight: CGFloat,
        bottomSheetType: YMBottomSheetType
        
    ) {
        self.contentView = contentView
        self._showSheet = showSheet
        self.sheetHeight = sheetHeight
        self.backgroundColor = .ymBlue
        self.bottomSheetType = bottomSheetType
    }
    
    public func body(content: Content) -> some View {
        content
            .sheet(isPresented: $showSheet) {
                switch bottomSheetType {
                case .dragBar:
                    contentView()
                        .cornerRadius(40, corners: [.topLeft, .topRight])
                        .presentationDragIndicator(.visible)
                        .presentationDetents([.height(sheetHeight)])
                case .nonDragBar:
                    contentView()
                        .cornerRadius(40, corners: [.topLeft, .topRight])
                        .presentationDetents([.height(sheetHeight)])
                        .presentationDragIndicator(.hidden)
                        .interactiveDismissDisabled()
                }
            }
    }
    
}
