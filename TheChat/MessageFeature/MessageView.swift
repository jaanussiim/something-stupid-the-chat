import ComposableArchitecture
import SwiftUI

internal struct MessageView: View {
    let store: StoreOf<Message>
    
    var body: some View {
        WithViewStore(store) {
            viewStore in
            
            Text(viewStore.message)
                .font(Font.body.bold())
                .foregroundColor(.black)
                .padding()
                .background(
                    content: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                    }
                )
        }
    }
}
