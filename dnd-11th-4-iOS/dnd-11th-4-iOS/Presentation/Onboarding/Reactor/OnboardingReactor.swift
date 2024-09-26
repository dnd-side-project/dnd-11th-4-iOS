//
//  OnboardingReactor.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/13/24.
//

import Foundation
import ReactorKit
import RxSwift

final class OnboardingReactor: Reactor {
    var initialState: State
    
    enum Action {
        case selectColor(ColorType)
    }
    
    enum Mutation {
        case setAnimation(String)
        case setLoginSuccess(accessToken: String, refreshToken: String)
        case setError(MDError)
    }
    
    struct State {
        var selectedAnimation: String?
        var isLoginSuccess: Bool = false
        var error: MDError?
    }
    
    init() {
        self.initialState = State()
    }
}

extension OnboardingReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .selectColor(let color):
            guard let token = TokenManager.shared.getTemporaryToken() else {
                return .just(.setError(NetworkManager.handleError(MDError.tokenError)))
            }
            
            let animationMutation = Observable.just(Mutation.setAnimation(color.fileName))
            let apiRequest = LoginService.appleLogin(token: token, color: color.serverName)
                .map { response in
                    return Mutation.setLoginSuccess(accessToken: response.accessToken, refreshToken: response.refreshToken)
                }
                .catch { error in
                    let handledError = NetworkManager.handleError(error)
                    return Observable.just(Mutation.setError(handledError))
                }
            
            return Observable.concat(animationMutation, apiRequest)
        }
        
        func reduce(state: State, mutation: Mutation) -> State {
            var newState = state
            switch mutation {
            case .setAnimation(let animationName):
                newState.selectedAnimation = animationName
            case .setLoginSuccess(let accessToken, let refreshToken):
                newState.isLoginSuccess = true
                TokenManager.shared.saveTokens(accessToken: accessToken, refreshToken: refreshToken)
            case .setError(let error):
                newState.error = error
            }
            return newState
        }
    }
}
