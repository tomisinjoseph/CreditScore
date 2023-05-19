//
//  LoadingState.swift
//  CreditScore
//
//  Created by Tomisin Joseph on 19/05/2023.
//

import SwiftUI

struct LoadingState: View {
    
    let text: String
    
    var body: some View {
        ZStack {
            Color(red: 0.6, green: 0.8, blue: 1)
                .ignoresSafeArea()
            VStack(spacing: 8) {
                ProgressView()
                Text(text)
                    .bold()
            }
        }
    }
}

struct LoadingState_Previews: PreviewProvider {
    static var previews: some View {
        LoadingState(text: "Fetching Credit Score")
    }
}
