import ComposableArchitecture

internal struct Application: ReducerProtocol {
    struct State: Equatable {
        var messages = IdentifiedArrayOf<Message>()
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
