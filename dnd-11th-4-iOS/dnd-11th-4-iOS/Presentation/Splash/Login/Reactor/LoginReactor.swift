//
//  LoginReactor.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/20/24.
//

import Foundation
import ReactorKit
import RxSwift
import AuthenticationServices

final class LoginReactor: Reactor {
    var initialState: State
    
    enum Action {
        case loginSuccess(String)
        case loginFailure(Error)
    }
    
    enum Mutation {
        case setLoginSuccess(String)
        case setError(Error)
    }
    
    struct State {
        var identityToken: String?
        var error: Error?
    }
    
    init() {
        self.initialState = State()
    }
}

extension LoginReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .loginSuccess(token):
            TokenManager.shared.setTemporaryToken(token)
            return .just(.setLoginSuccess(token))
            
        case let .loginFailure(error):
            return .just(.setError(error))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setLoginSuccess(token):
            newState.identityToken = token
        case let .setError(error):
            newState.error = error
        }
        return newState
    }
}
