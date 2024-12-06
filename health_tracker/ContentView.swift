import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to My First App!")
                .font(.largeTitle)
                .padding()
            Text("This is a simple iOS app.")
                .foregroundColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
