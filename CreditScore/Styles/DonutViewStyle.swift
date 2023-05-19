//
//  DonutViewStyle.swift
//  CreditScore
//
//  Created by Tomisin Joseph on 19/05/2023.
//

import Foundation
import SwiftUI

struct DonutViewStyle: ProgressViewStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        let percentageCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack {
            Circle()
                .fill(.white)
                .overlay(
                    Circle()
                        .trim(from: 0, to: percentageCompleted)
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .foregroundColor(highlightColour)
                )
        }
    }
}
