//
//  AccountDeleteReactor.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 10/8/24.
//

import Foundation
import ReactorKit
import RxSwift

final class AccountDeleteReactor: Reactor {
    var initialState: State
    
    enum Action {
        case deleteAccount
    }
    
    enum Mutation {
        case setAccountDeleted
        case setError(MDError)
    }
    
    struct State {
        var isAccountDeleted: Bool = false
        var error: MDError?
    }
    
    init() {
        self.initialState = State()
    }
}

extension AccountDeleteReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .deleteAccount:
            guard let refreshToken = TokenManager.shared.getRefreshToken() else {
                return Observable.just(Mutation.setError(MDError.tokenError))
            }
            let request = WithdrawRequest(authorizationCode: refreshToken)
            return LoginService.revokeToken(request: request)
                .flatMap { _ -> Observable<Mutation> in
                    TokenManager.shared.clearTokens()
                    return Observable.just(Mutation.setAccountDeleted)
                }
                .catch { error in
                    let handledError = NetworkManager.handleError(error)
                    return Observable.just(Mutation.setError(handledError))
                }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setAccountDeleted:
            newState.isAccountDeleted = true
        case .setError(let error):
            newState.error = error
        }
        return newState
    }
}
