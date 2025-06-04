import SwiftUI

struct ContentView: View {
    @EnvironmentObject var newsViewModel: NewsViewModel
    
    var body: some View {
        NavigationView {
            NewsView()
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NewsViewModel())
    }
}
