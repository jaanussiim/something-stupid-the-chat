import ComposableArchitecture
import Foundation

internal struct Message: ReducerProtocol {
    struct State: Equatable, Identifiable {
        let id: UUID
        let message: String
        
        init(message: String) {
            self.id = UUID()
            self.message = message
        }
    }
    
    enum Action {
        
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce {
            state, action in
            
            return .none
        }
    }
}
