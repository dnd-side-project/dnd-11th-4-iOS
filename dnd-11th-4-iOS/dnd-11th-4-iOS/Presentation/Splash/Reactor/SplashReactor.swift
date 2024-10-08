//
//  SplashReactor.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 10/8/24.
//

import Foundation
import ReactorKit
import RxSwift

final class SplashReactor: Reactor {
    var initialState: State
    
    enum Action {
        case checkRefreshToken
    }
    
    enum Mutation {
        case navigateToHome
        case navigateToLogin
    }
    
    struct State {
        var isHomeNeeded: Bool = false
        var isLoginNeeded: Bool = false
    }
    
    init() {
        self.initialState = State()
    }
}

extension SplashReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .checkRefreshToken:
            guard let refreshToken = TokenManager.shared.getRefreshToken() else {
                return .just(.navigateToLogin)
            }
            let request = RefreshTokenRequest(refreshToken: refreshToken)
            return LoginService.reIssueToken(request: request)
                .flatMap { response -> Observable<Mutation> in
                    TokenManager.shared.saveTokens(accessToken: response.accessToken, refreshToken: response.refreshToken)
                    return .just(.navigateToHome)
                }
                .catch { _ in .just(Mutation.navigateToLogin) }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .navigateToHome:
            newState.isHomeNeeded = true
        case .navigateToLogin:
            newState.isLoginNeeded = true
        }
        return newState
    }
}
