import ComposableArchitecture
import SwiftUI

@main
struct TheChatApp: App {
    var body: some Scene {
        WindowGroup {
            ApplicationView(
                store: Store(
                    initialState: Application.State(),
                    reducer: Application()
                )
            )
        }
    }
}
