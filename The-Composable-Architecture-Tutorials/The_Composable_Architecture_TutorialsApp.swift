import ComposableArchitecture
import SwiftUI

@main
struct The_Composable_Architecture_TutorialsApp: App {
//    static let store = Store(initialState: CounterFeature.State()) {
//        CounterFeature()
//            ._printChanges()
//    }
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
    }
    
    var body: some Scene {
        WindowGroup {
//            CounterView(store: Self.store)
            AppView(store: Self.store)
        }
    }
}
