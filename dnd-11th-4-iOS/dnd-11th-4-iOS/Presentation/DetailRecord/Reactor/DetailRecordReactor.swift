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
        case detailRecord(DetailRecordAppData)
    }
    
    enum Mutation {
        case setDetailRecordData(DetailRecordAppData)
    }
    
    struct State {
        var detailRecordData: DetailRecordAppData?
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .detailRecord(let data):
            return Observable.just(Mutation.setDetailRecordData(data))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setDetailRecordData(let data):
            newState.detailRecordData = data
        }
        return newState
    }
}
