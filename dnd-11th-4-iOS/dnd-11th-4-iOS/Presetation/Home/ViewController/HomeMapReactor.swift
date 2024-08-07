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
    var totalMapColor: [TotalMapColorModelArray]
}

struct SelectedMapModel {
    let selectedMapName: String
    let selectedMapColor: UIColor
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
        case setSpecificMapColor(SelectedMapModel)
    }
    
    struct State {
        var totalMapColorState = TotalMapModel(selectedMap: nil, totalMapColor: [])
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .totalMapColor(let model):
            let mapColorArray = model.map { data in TotalMapColorModelArray(mapName: data.name, mapColor: .mapPink1) }
            let totalMapModel = TotalMapModel(selectedMap: nil, totalMapColor: mapColorArray)
            return Observable.just(Mutation.setTotalMapColor(totalMapModel))
        case .mapAction(let type):
            let specificModel = SelectedMapModel(selectedMapName: type.rawValue, selectedMapColor: .mapSelect, isHidden: false)
            return Observable.just(Mutation.setSpecificMapColor(specificModel))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setTotalMapColor(let model):
            newState.totalMapColorState = model
        case .setSpecificMapColor(let specificModel):
            var tempState = newState
            if let index = tempState.totalMapColorState.totalMapColor.firstIndex(where: { $0.mapName == specificModel.selectedMapName }) {
                tempState.totalMapColorState.selectedMap = specificModel
                tempState.totalMapColorState.totalMapColor[index] = TotalMapColorModelArray(mapName: specificModel.selectedMapName,
                                                                                            mapColor: specificModel.selectedMapColor)
            }
            return tempState
        }
        return newState
    }
}
