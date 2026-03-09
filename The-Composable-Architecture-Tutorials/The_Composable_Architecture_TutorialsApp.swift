import ComposableArchitecture
import SwiftUI

@main
struct The_Composable_Architecture_TutorialsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: CounterFeature.State()) {
                CounterFeature()
            })
        }
    }
}
