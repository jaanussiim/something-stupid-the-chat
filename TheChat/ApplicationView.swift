import ComposableArchitecture
import SwiftUI

internal struct ApplicationView: View {
    let store: StoreOf<Application>
    
    var body: some View {
        WithViewStore(store) {
            viewStore in
            
            Text("Application")
        }
    }
}
