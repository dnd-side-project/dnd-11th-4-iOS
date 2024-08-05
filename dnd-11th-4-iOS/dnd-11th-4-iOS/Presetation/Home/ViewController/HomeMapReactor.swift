//
//  HomeMapReactor.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/5/24.
//

import ReactorKit
import UIKit

struct InitMapColorModel {
    let mapName: String
    let mapColor: UIColor
}

struct DummyModel {
    let name: String
    let opacity: Int
    let blue: OpacityColorType
}

class HomeMapReactor: Reactor {
    
    var initialState: State
    
    enum Action {
        case totalMapColor([DummyModel])
        case 서울Action([DummyModel])
    }
    
    enum Mutation {
        case setTotalMapColor([InitMapColorModel])
    }
    
    struct State {
        var initMapViewColor: [InitMapColorModel] = []
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .totalMapColor(let model):
            let array = model.map { data in
                InitMapColorModel(mapName: data.name, mapColor: .black3)
            }
            return Observable.just(Mutation.setTotalMapColor(array))
        case .서울Action(let model):
            let array = model.map { data in
                // 여기서 opacity 값이랑 type을 통해 color를 설정해 줄 메서드 필요함
                InitMapColorModel(mapName: data.name, mapColor: .mapPink1)
            }
            return Observable.just(Mutation.setTotalMapColor(array))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setTotalMapColor(let model):
            newState.initMapViewColor = model
        }
        return newState
    }
}
