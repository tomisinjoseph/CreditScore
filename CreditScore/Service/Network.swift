//
//  Network.swift
//  CreditScore
//
//  Created by Tomisin Joseph on 15/05/2023.
//


import Foundation

//MARK: - Protocols
protocol CreditProfileNetworkRequest {
    func convertData() async throws -> CreditProfile
}

protocol FetchDataProtocol {
    func getData(from: URL) async throws -> Data
}

//MARK: - Implementation
final class DataImplementation: FetchDataProtocol {
    
    func getData(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}

final class NetworkRequestImplementation: CreditProfileNetworkRequest {
    
    private let fetchingData: FetchDataProtocol
    init(fetchingData: FetchDataProtocol = DataImplementation()) {
        self.fetchingData = fetchingData
    }
 
    func convertData() async throws -> CreditProfile {
        guard let url = URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values") else {
            throw NetworkError.noUrl
        }
        do {
            let data = try await fetchingData.getData(from: url)
            
            let decodedResponse = try JSONDecoder().decode(CreditProfile.self, from: data)
            return decodedResponse
            
        } catch {
            throw NetworkError.noData
        }
    }
}

// MARK: - Errors
enum NetworkError: Error {
    case noUrl
    case noData
}

// MARK: - Mocks

    final class MockFetchDataProtocol: FetchDataProtocol {
        func getData(from: URL) async throws -> Data {
            Data()
        }
    }

final class MockCreditProfileNetworkRequest: CreditProfileNetworkRequest {
    func convertData() async throws -> CreditProfile {
        CreditProfile(creditReportInfo: .stub)
    }
}
