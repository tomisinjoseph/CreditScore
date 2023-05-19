//
//  Progress view.swift
//  CreditScore
//
//  Created by Tomisin Joseph on 19/05/2023.
//

import SwiftUI

struct ProgressBarView: View {
    @State var value: Int
    
    var body: some View {

            ZStack() {

                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(highlightColour)
                    .frame(height: 80)
                    .overlay(
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 18)
                                .foregroundColor(
                                    progressColour)
                                .frame(width: CGFloat(self.value)/100 * geometry.size.width, height: 80)
                        }
                    )
            HStack {
                Text("Percentage credit used")
                    .bold()
                Spacer()
                Text("\(value)%")
                    .bold()
            }
            .padding()
        }
    }
    }

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(value: 23)
    }
}

// I want the alignment of the overlay to be trailing
