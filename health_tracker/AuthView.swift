//
//  AuthView.swift
//  health_tracker
//
//  Created by Daanish Faiz on 10/12/2024.
//

import SwiftUI



struct AuthView: View {

    @State private var authorizationGranted = false
    @State private var error: Error?
    
    var body: some View {
        VStack {
            Text("Sync your health data to get started")
                .font(.largeTitle)
                .padding()
    
            Button("Request Authorization") {
                HealthKitManager.shared.requestAuthorization { success, error in
                    self.authorizationGranted = success
                    self.error = error
                }
            }
            
            if authorizationGranted {
                Text("HealthKit authorization granted.")
                Button("Fetch Steps") {
                    HealthKitManager.shared.fetchStepCountData()
                }
            } else if let error = error {
                Text("Authorization failed: \(error.localizedDescription)")
            } else {
                Text("Authorization not determined yet.")
            }
           
        }
        .navigationTitle("AuthView")
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
