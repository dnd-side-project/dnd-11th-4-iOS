//
//  HomeMapReactor.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/5/24.
//

import ReactorKit
import UIKit

struct TotalMapModel {
    var selectedMap: SelectedMapModel?
    var totalMapColorArray: [TotalMapColorModelArray]
}

struct SelectedMapModel {
    let selectedMapName: String
    let isHidden: Bool
}

struct TotalMapColorModelArray {
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
        case mapAction((RegionType))
    }
    
    enum Mutation {
        case setTotalMapColor(TotalMapModel)
        case setSelectedMapColor(TotalMapModel)
    }
    
    struct State {
        var totalMapColorState = TotalMapModel(selectedMap: nil, totalMapColorArray: [])
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .totalMapColor(let model):
            let mapColorArray = model.map { data in TotalMapColorModelArray(mapName: data.name, mapColor: .mapPink1) }
            initialState.totalMapColorState = TotalMapModel(selectedMap: nil, totalMapColorArray: mapColorArray)
            return Observable.just(Mutation.setTotalMapColor(initialState.totalMapColorState))
        case .mapAction(let type):
            var tempState = initialState.totalMapColorState
            if let index = tempState.totalMapColorArray.firstIndex(where: { $0.mapName == type.rawValue }) {
                tempState.totalMapColorArray[index] = TotalMapColorModelArray(mapName: type.rawValue,
                                                                              mapColor: .mapSelect)
                tempState.selectedMap = SelectedMapModel(selectedMapName: type.rawValue, isHidden: false)
            }
            return Observable.just(Mutation.setSelectedMapColor(tempState))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setTotalMapColor(let model):
            newState.totalMapColorState = model
        case .setSelectedMapColor(let specificModel):
            newState.totalMapColorState = specificModel
        }
        return newState
    }
}
