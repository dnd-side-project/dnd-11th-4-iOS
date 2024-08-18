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
    }
    
    struct State {
        var selectedAnimation: String?
    }
    
    init() {
        self.initialState = State()
    }
}

extension OnboardingReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .selectColor(let color):
            return Observable.just(Mutation.setAnimation(color.fileName))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .setAnimation(let animationName):
            state.selectedAnimation = animationName
        }
        return state
    }
}


