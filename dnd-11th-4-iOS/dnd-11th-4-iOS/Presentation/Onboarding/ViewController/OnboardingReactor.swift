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
        case selectColor(Color)
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
            let animationName: String
            switch color {
            case .pink:
                animationName = "Onboarding_Pink"
            case .orange:
                animationName = "Onboarding_Orange"
            case .yellow:
                animationName = "Onboarding_Yellow"
            case .green:
                animationName = "Onboarding_Green"
            case .blue:
                animationName = "Onboarding_Blue"
            case .purple:
                animationName = "Onboarding_Purple"
            }
            return Observable.just(Mutation.setAnimation(animationName))
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

enum Color {
    case pink
    case orange
    case yellow
    case green
    case blue
    case purple
}
