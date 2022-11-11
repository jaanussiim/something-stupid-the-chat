import ComposableArchitecture

internal struct Application: ReducerProtocol {
    struct State: Equatable {
        @BindableState var message = ""
        
        var messages = IdentifiedArrayOf<Message.State>()
    }
    
    enum Action: BindableAction {
        case clearMessage(Message.State.ID)
        case post
        
        case binding(BindingAction<State>)
        case messages(id: Message.State.ID, action: Message.Action)
    }
    
    var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        Reduce {
            state, action in
            
            switch action {
            case .clearMessage(let id):
                state.messages[id: id] = nil
                return .none
                
            case .post:
                guard state.message.hasValue else {
                    return .none
                }
                let message = Message.State(message: state.message.trimmed)
                state.messages.append(message)
                state.message = ""
                return EffectTask.run {
                    send in
                    
                    try await Task.sleep(seconds: 10)
                    await send(.clearMessage(message.id), animation: .default)
                }
                
            case .binding:
                return .none
                
            case .messages:
                return .none
            }
        }
        .forEach(\.messages, action: /Action.messages(id:action:)) {
            Message()
        }
    }
}

extension String {
    var hasValue: Bool {
        !trimmed.isEmpty
    }
    
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }
}
