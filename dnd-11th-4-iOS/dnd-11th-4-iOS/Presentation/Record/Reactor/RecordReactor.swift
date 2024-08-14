//
//  RecordReactor.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/14/24.
//

import Foundation
import ReactorKit

final class RecordReactor: Reactor {
    
    var initialState: State
    
    enum Action {
    }
    
    enum Mutation {
    }
    
    struct State {
        let regionArray = ["서울", "경기도", "인천", "강원도", "충청북도", "충청남도", "대전", "경상북도",
                           "경상남도", "대구", "울산", "부산", "전라북도", "전라남도", "광주", "제주도"]
        var selectedRegion = "서울"
    }
    
    init() {
        self.initialState = State()
    }
    
//    func mutate(action: Action) -> Observable<Mutation> {
//        print("안녕")
//        return Observable()
//    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        return newState
    }
}
