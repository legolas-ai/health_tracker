import SwiftUI


struct ContentView: View {
 


    var body: some View {
        NavigationView {
            VStack {
                Text("Pulse!")
                    .font(.largeTitle)
                    .padding()
                Text("Health and Routine Tracking")
                    .foregroundColor(.gray)
                
    
                
                // Navigation to AuthView
                NavigationLink(
                    destination: AuthView() // Your new AuthView
                ) {
                    Text("Go to AuthView")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                
                
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
