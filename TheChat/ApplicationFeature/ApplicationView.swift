import ComposableArchitecture
import SwiftUI

internal struct ApplicationView: View {
    let store: StoreOf<Application>
    
    var body: some View {
        WithViewStore(store) {
            viewStore in
            
            VStack(alignment: .trailing) {
                Spacer()
                ForEachStore(
                    store.scope(state: \.messages, action: Application.Action.messages(id:action:)),
                    content: MessageView.init(store:)
                )
                HStack(alignment: .top) {
                    TextEditor(text: viewStore.binding(\.$message))
                    Button(action: { viewStore.send(.post, animation: .default) }) {
                        Image(systemName: "arrow.up.circle.fill")
                    }
                    .keyboardShortcut(.return, modifiers: .command)
                }
                .frame(height: 50)
                .padding()
            }
        }
        .background(Color.green)
    }
}
