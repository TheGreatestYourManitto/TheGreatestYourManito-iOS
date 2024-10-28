//
//  YMNavigationBar.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

public struct YMNavigationBarModifier<C, L, R>: ViewModifier where C: View, L: View, R: View {
    let center: (() ->C)?
    let left: (() -> L)?
    let right: (() -> R)?
    let backgroundColor: Color
    
    public init(
        center: (() -> C)? = {EmptyView()},
        left: (()-> L)? = {EmptyView()},
        right: (()-> R)? = {EmptyView()},
        backgroundColor: Color? = nil
    ) {
        self.center = center
        self.left = left
        self.right = right
        self.backgroundColor = backgroundColor ?? .gray4
    }
    
    public func body(content: Content) -> some View {
        VStack {
            ZStack {
                HStack(spacing: 0) {
                    left?()
                    Spacer()
                    right?()
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                
                HStack {
                    Spacer()
                    center?()
                    Spacer()
                }
            }
            .frame(height: 100)
            
            Spacer(minLength: 0)
            
            content
            
            Spacer(minLength: 0)
        }
        .background(backgroundColor.ignoresSafeArea(edges: [.top, .bottom]))
        .navigationBarHidden(true)
    }
}

public extension View {
    func ymNavBar<C, L, R> (
        center: @escaping (() -> C),
        left: @escaping (() -> L),
        right: @escaping (() -> R)
    ) -> some View where C: View, L: View, R: View {
        modifier(YMNavigationBarModifier(center: center, left: left, right: right))
    }
    
    func ymNavBar<C, R> (
        center: @escaping (() -> C),
        right: @escaping (() -> R)
    ) -> some View where C: View, R: View {
        modifier(YMNavigationBarModifier(center: center, right: right))
    }

    func ymNavBar<C, L> (
        center: @escaping (() -> C),
        left: @escaping (() -> L)
    ) -> some View where C: View, L: View {
        modifier(YMNavigationBarModifier(center: center, left: left))
    }
    
    func ymNavBar<C> (
        center: @escaping (() -> C)
    ) -> some View where C: View {
        modifier(YMNavigationBarModifier(center: center))
    }
    
    func ymNavBar<L> (
        left: @escaping (() -> L)
    ) -> some View where L: View {
        modifier(YMNavigationBarModifier(left: left))
    }
    
    func ymNavBar<R> (
        right: @escaping (() -> R)
    ) -> some View where R: View {
        modifier(YMNavigationBarModifier(right: right))
    }
    
    func ymNavBar<L, R> (
        left: @escaping (() -> L),
        right: @escaping (() -> R)
    ) -> some View where L: View, R: View{
        modifier(YMNavigationBarModifier(left: left, right: right))
    }
}
