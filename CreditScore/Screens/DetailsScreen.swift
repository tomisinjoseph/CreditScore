//
//  DetailsView.swift
//  CreditScore
//
//  Created by Tomisin Joseph on 15/05/2023.
//

import SwiftUI

struct DetailsScreen: View {
    
    let creditDetails: CreditProfile
    
    var body: some View {
        ZStack {
            ZStack {
                backgroundColour
                    .edgesIgnoringSafeArea(.all)
                
                GeometryReader { position in
                    RoundedRectangle(cornerRadius: 18)
                        .frame(height: position.size.height * 0.34)
                        .ignoresSafeArea()
                        .foregroundColor(.white)
                }
            }
            VStack(spacing: 16) {
                Text("Your score is")
                    .bold()
                Text("\(creditDetails.creditReportInfo.equifaxScoreBandDescription)")
                    .bold()
                    .font(.largeTitle)
                Spacer()
                    .frame(maxHeight: 50)
                BasicBlockView(title: "Scoreband", value:  "\(creditDetails.creditReportInfo.scoreBand) out of 7")
                ProgressBarView(value: creditDetails.creditReportInfo.percentageCreditUsed)
                BasicBlockView(title: "Days until next report", value: "\(creditDetails.creditReportInfo.daysUntilNextReport) days")
                MiniDonutView(value: creditDetails.creditReportInfo.score)
            }
            .padding()
            }
        }
    }


struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(creditDetails: .stub)
    }
}
