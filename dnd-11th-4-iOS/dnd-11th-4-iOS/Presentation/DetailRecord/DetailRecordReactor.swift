//
//  DetailRecordReactor.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 9/1/24.
//

import Foundation
import ReactorKit

final class DetailRecordReactor: Reactor {
    
    var initialState: State
    
    enum Action {
    }
    
    enum Mutation {
        case setImageArray([UIImage])
    }
    
    struct State {
        var imageArray = [Constant.Image.imageDetailEmpty,
                          Constant.Image.imageDetailEmpty]
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setImageArray(let array):
            newState.imageArray = array
        }
        return newState
    }
}
