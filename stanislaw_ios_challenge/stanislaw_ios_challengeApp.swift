import SwiftUI
import SwiftData

@main
struct stanislaw_ios_challengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NewsViewModel())
        }
    }
}
