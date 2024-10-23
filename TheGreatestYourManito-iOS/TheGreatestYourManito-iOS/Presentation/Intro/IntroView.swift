//
//  IntroView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 10/23/24.
//

import SwiftUI

struct IntroView: View {
    @State private var tag:Int? = nil
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(.clover)
                    .frame(maxHeight: .infinity)
                
                Spacer()
                
                NavigationLink(destination: SignUpView(), tag: 1, selection: self.$tag) {
                    YMButton(title: "시작하기", buttonType: .confirm, action: {self.tag = 1})
                        .padding(.bottom, 20)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}


#Preview {
    IntroView()
}
