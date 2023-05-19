//
//  CreditProfileViewModel.swift
//  CreditScore
//
//  Created by Tomisin Joseph on 18/05/2023.
//

import Foundation

protocol CreditProfileViewModel: ObservableObject {
    func getCreditProfile() async
}

 @MainActor

final class CreditProfileViewModelImplementation: CreditProfileViewModel {
        
    @Published var creditProfile: CreditProfile = .stub
    
    private let networkRequest: CreditProfileNetworkRequest
    init(networkRequest: CreditProfileNetworkRequest) {
        self.networkRequest = networkRequest
    }
    
    func getCreditProfile() async {
        do {
            self.creditProfile = try await networkRequest.convertData()
        } catch {
            print("View Model error")
        }
    }
}

// MARK: - Mocks

final class MockCreditProfileViewModelImplementation: CreditProfileViewModel {
    func getCreditProfile() async {
    }
}
