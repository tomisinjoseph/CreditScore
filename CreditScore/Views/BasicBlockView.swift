//
//  BasicBlockView.swift
//  CreditScore
//
//  Created by Tomisin Joseph on 19/05/2023.
//

import SwiftUI

struct BasicBlockView: View {
    
    @State var title: String
    @State var value: String
    
    var body: some View {
        ZStack {
        RoundedRectangle(cornerRadius: 18)
            .foregroundColor(highlightColour)
            .frame(height: 80)
        HStack {
            Text("\(title)")
                .bold()
            Spacer()
            Text("\(value)")
                .bold()
        }
        .padding()
    }

    }
}

struct BasicBlockView_Previews: PreviewProvider {
    static var previews: some View {
        BasicBlockView(title: "Score", value: "2 out of 7")
    }
}
