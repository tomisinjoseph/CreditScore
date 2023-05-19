//
//  DonutView2View.swift
//  CreditScore
//
//  Created by Tomisin Joseph on 19/05/2023.
//

import SwiftUI

struct DonutView: View {
    
    let creditDetails: CreditProfile
    
    var body: some View {
        ZStack {
            ProgressView(value: Double(creditDetails.creditReportInfo.score), total: Double(creditDetails.creditReportInfo.maxScoreValue))
             .progressViewStyle(DonutViewStyle())
            VStack {
                Text("Your credit score is")
                    .font(.title3)
                    .foregroundColor(.black)
                Text("\(creditDetails.creditReportInfo.score)")
                    .font(.system(size: 70))
                    .bold()
                    .foregroundColor(.black)
                Text("out of 700")
                    .font(.title3)
                    .foregroundColor(.black)
            }
        }
    }
}

struct DonutView_Previews: PreviewProvider {
    static var previews: some View {
        DonutView(creditDetails: .stub)
    }
}
