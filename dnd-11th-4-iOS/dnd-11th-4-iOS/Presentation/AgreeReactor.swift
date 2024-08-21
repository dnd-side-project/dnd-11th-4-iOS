//
//  AgreeReactor.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/21/24.
//

import Foundation
import ReactorKit
import RxSwift

final class AgreeReactor: Reactor {
    var initialState: State
    
    enum Action {
        case toggleCheckbox
    }
    
    enum Mutation {
        case setCheckboxSelected(Bool)
    }
    
    struct State {
        var isCheckboxSelected: Bool = false
    }
    
    init() {
        self.initialState = State()
    }
}

extension AgreeReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .toggleCheckbox:
            let newCheckboxState = !currentState.isCheckboxSelected
            return Observable.just(.setCheckboxSelected(newCheckboxState))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setCheckboxSelected(isSelected):
            state.isCheckboxSelected = isSelected
        }
        return state
    }
}
