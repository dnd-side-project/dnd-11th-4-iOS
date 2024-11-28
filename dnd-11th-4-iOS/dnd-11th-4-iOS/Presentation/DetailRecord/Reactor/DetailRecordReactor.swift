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
        case deleteRecord
        case detailRecord
    }
    
    enum Mutation {
        case setDetailRecordData(RecordResponse?)
        case complteDelete(Bool)
        case setError(MDError)
    }
    
    struct State {
        var detailRecordData: RecordResponse?
        var completedAPI: Bool?
    }
    
    init(model: RecordResponse) {
        self.initialState = State(detailRecordData: model)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .detailRecord:
            return Observable.just(Mutation.setDetailRecordData(currentState.detailRecordData))
        case .deleteRecord:
            return RecordService.deleteRecordAPI(id: currentState.detailRecordData?.id ?? 0)
                .map { response in
                    return Mutation.complteDelete(true)
                }
                .catch { error in
                    return Observable.just(Mutation.setError(NetworkManager.handleError(error)))
                }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setDetailRecordData(let data):
            newState.detailRecordData = data
        case .complteDelete(let state):
            newState.completedAPI = state
        case .setError(let error):
            print(error)
        }
        return newState
    }
}
