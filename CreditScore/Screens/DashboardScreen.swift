//
//  ScoreView.swift
//  CreditScore
//
//  Created by Tomisin Joseph on 15/05/2023.
//

import SwiftUI

struct DashboardScreen: View {

    @StateObject var vm = CreditProfileViewModelImplementation(networkRequest: NetworkRequestImplementation())
    
    var body: some View {
        NavigationView {
            if vm.creditProfile.creditReportInfo == .stub {
                LoadingState(text: "Fetching Credit Data")
            } else {
                ZStack {
                    backgroundColour
                        .ignoresSafeArea()
                    NavigationLink(destination: DetailsScreen(creditDetails: vm.creditProfile)) {
                        DonutView(creditDetails: vm.creditProfile)
                            .padding()
                    }
                    .navigationTitle("My Dashboard")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .task {
            await vm.getCreditProfile()
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
