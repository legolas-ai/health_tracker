import SwiftUI


struct ContentView: View {
    @State private var authorizationGranted = false
    @State private var error: Error?

    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Pulse!")
                    .font(.largeTitle)
                    .padding()
                Text("Health and Routine Tracking")
                    .foregroundColor(.gray)
                
                Button("Request Authorization") {
                    HealthKitManager.shared.requestAuthorization { success, error in
                        self.authorizationGranted = success
                        self.error = error
                    }
                }
                
                if authorizationGranted {
                    Text("HealthKit authorization granted.")
                } else if let error = error {
                    Text("Authorization failed: \(error.localizedDescription)")
                } else {
                    Text("Authorization not determined yet.")
                }
                Button("Fetch Steps") {
                    HealthKitManager.shared.fetchStepCountData()
                }
            }
            .navigationTitle("Home")
                
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
