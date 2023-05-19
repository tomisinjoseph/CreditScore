//
//  CreditProfile.swift
//  CreditScore
//
//  Created by Tomisin Joseph on 15/05/2023.
//

import Foundation

struct CreditProfile: Codable {
    let creditReportInfo: CreditReportInfo
}

struct CreditReportInfo: Codable, Equatable {
    let score: Int
    let scoreBand: Int
    let maxScoreValue: Int
    let minScoreValue: Int
    let percentageCreditUsed: Int
    let equifaxScoreBand: Int
    let equifaxScoreBandDescription: String
    let daysUntilNextReport: Int
}

extension CreditProfile {

    static let stub = Self(
        creditReportInfo: .stub
    )
}

extension CreditReportInfo {
    
    static let stub = Self(score: 1,
                           scoreBand: 2,
                           maxScoreValue: 3,
                           minScoreValue: 40,
                           percentageCreditUsed: 5,
                           equifaxScoreBand: 6,
                           equifaxScoreBandDescription: "Nice",
                           daysUntilNextReport: 7
    )
    
}
