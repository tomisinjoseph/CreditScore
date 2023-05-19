//
//  NetworkTests.swift
//  CreditScoreTests
//
//  Created by Tomisin Joseph on 17/05/2023.
//

import XCTest
@testable import CreditScore

final class NetworkRequestImplementationTests: XCTestCase {

    private var mockData: MockFetchDataProtocol!
    private var mockNetworkRequest: MockCreditProfileNetworkRequest!
    private var sut: NetworkRequestImplementation!

    override func setUp() {
        super.setUp()
        mockData = MockFetchDataProtocol()
        mockNetworkRequest = MockCreditProfileNetworkRequest()
        sut = NetworkRequestImplementation(fetchingData: mockData)
    }

    override func tearDown() {
        mockData = nil
        sut = nil
        super.tearDown()
    }

    func test_convertData_returns_CreditProfileResponse() async throws {

        // When
        let expectedValue = try await sut.convertData()

        // Then
        XCTAssertEqual(expectedValue.creditReportInfo, .stub)
    }
}
