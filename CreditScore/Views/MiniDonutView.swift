//
//  MiniDonutView.swift
//  CreditScore
//
//  Created by Tomisin Joseph on 19/05/2023.
//

import SwiftUI

struct MiniDonutView: View {
    
    @State var value: Int
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(highlightColour, lineWidth: 8)
                .background(Circle().fill(.white))
                .frame(width: 160, height: 160)
            Text("\(value)")
                .font(.title)
                .bold()
        }
    }
}

struct MiniDonutView_Previews: PreviewProvider {
    static var previews: some View {
        MiniDonutView(value: 9)
    }
}
