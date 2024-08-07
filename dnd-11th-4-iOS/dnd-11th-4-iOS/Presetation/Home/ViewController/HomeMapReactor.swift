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

struct DummyResponse {
    let name: String
    let opacity: Int
    let colorType: OpacityColorType
}

class HomeMapReactor: Reactor {
    
    var initialState: State
    
    enum Action {
        case totalMapColor
        case mapAction((RegionType))
    }
    
    enum Mutation {
        case setTotalMapColor(TotalMapModel)
        case setSelectedMapColor(TotalMapModel)
    }
    
    struct State {
        var totalMapColorState = TotalMapModel(selectedMap: nil, totalMapColorArray: [])
        var dummyState = [DummyResponse(name: "서울", opacity: 1, colorType: .pink(3)),
                          DummyResponse(name: "경기도", opacity: 1, colorType: .yellow(1)),
                          DummyResponse(name: "인천", opacity: 1, colorType: .blue(1)),
                          DummyResponse(name: "강원도", opacity: 1, colorType: .yellow(1)),
                          DummyResponse(name: "충청북도", opacity: 1, colorType: .blue(1)),
                          DummyResponse(name: "충청남도", opacity: 1, colorType: .yellow(1)),
                          DummyResponse(name: "대전", opacity: 1, colorType: .blue(1)),
                          DummyResponse(name: "경상북도", opacity: 1, colorType: .yellow(1)),
                          DummyResponse(name: "경상남도", opacity: 1, colorType: .blue(1)),
                          DummyResponse(name: "대구", opacity: 1, colorType: .purple(2)),
                          DummyResponse(name: "울산", opacity: 1, colorType: .blue(1)),
                          DummyResponse(name: "부산", opacity: 1, colorType: .yellow(0)),
                          DummyResponse(name: "전라북도", opacity: 1, colorType: .blue(1)),
                          DummyResponse(name: "전라남도", opacity: 1, colorType: .yellow(1)),
                          DummyResponse(name: "광주", opacity: 1, colorType: .blue(1)),
                          DummyResponse(name: "제주도", opacity: 1, colorType: .yellow(1))]
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .totalMapColor:
            // 추후 여기서 서버 통신, 현재는 dummyResponse로 color 세팅
            let mapColorArray = initialState.dummyState.map({ data in
                TotalMapColorModelArray(mapName: data.name, mapColor: data.colorType.color)
            })
            
            initialState.totalMapColorState = TotalMapModel(totalMapColorArray: mapColorArray)
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
