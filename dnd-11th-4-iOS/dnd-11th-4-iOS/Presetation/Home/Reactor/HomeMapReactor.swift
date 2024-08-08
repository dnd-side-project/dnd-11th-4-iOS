//
//  HomeMapReactor.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/5/24.
//

import Foundation
import ReactorKit

final class HomeMapReactor: Reactor {
    
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
        var totalMapColorState = TotalMapModel(selectedMap: nil, totalMapArray: [])
        var dummyState = [ColorWithOpacityModel(name: "서울", opacity: 1, colorType: .pink(3)),
                          ColorWithOpacityModel(name: "경기도", opacity: 1, colorType: .yellow(1)),
                          ColorWithOpacityModel(name: "인천", opacity: 1, colorType: .blue(1)),
                          ColorWithOpacityModel(name: "강원도", opacity: 1, colorType: .yellow(1)),
                          ColorWithOpacityModel(name: "충청북도", opacity: 1, colorType: .blue(1)),
                          ColorWithOpacityModel(name: "충청남도", opacity: 1, colorType: .yellow(1)),
                          ColorWithOpacityModel(name: "대전", opacity: 1, colorType: .blue(1)),
                          ColorWithOpacityModel(name: "경상북도", opacity: 1, colorType: .yellow(1)),
                          ColorWithOpacityModel(name: "경상남도", opacity: 1, colorType: .blue(1)),
                          ColorWithOpacityModel(name: "대구", opacity: 1, colorType: .purple(2)),
                          ColorWithOpacityModel(name: "울산", opacity: 1, colorType: .blue(1)),
                          ColorWithOpacityModel(name: "부산", opacity: 1, colorType: .yellow(0)),
                          ColorWithOpacityModel(name: "전라북도", opacity: 1, colorType: .blue(1)),
                          ColorWithOpacityModel(name: "전라남도", opacity: 1, colorType: .yellow(1)),
                          ColorWithOpacityModel(name: "광주", opacity: 1, colorType: .blue(1)),
                          ColorWithOpacityModel(name: "제주도", opacity: 1, colorType: .yellow(1))]
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .totalMapColor:
            // 추후 여기서 서버 통신, 현재는 dummyResponse로 color 세팅
            let mapColorArray = initialState.dummyState.map({ data in
                MapModel(mapName: data.name, mapColor: data.colorType.color)
            })
            
            initialState.totalMapColorState = TotalMapModel(totalMapArray: mapColorArray)
            return Observable.just(Mutation.setTotalMapColor(initialState.totalMapColorState))
        case .mapAction(let type):
            var tempState = initialState.totalMapColorState
            if let index = tempState.totalMapArray.firstIndex(where: { $0.mapName == type.rawValue }) {
                tempState.totalMapArray[index] = MapModel(mapName: type.rawValue,
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
