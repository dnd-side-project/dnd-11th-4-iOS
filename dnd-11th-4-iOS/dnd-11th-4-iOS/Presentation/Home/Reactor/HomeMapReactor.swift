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
        case viewWillAppear
        case mapAction(RegionType)
        case mapInset(DeviceSize)
    }
    
    enum Mutation {
        case setTotalMap(TotalMapModel)
        case setSelectedMap(TotalMapModel)
        case setMapInset(TopAndLeadingInset?)
    }
    
    struct State {
        var totalMapState = TotalMapModel(selectedMap: nil, totalMapArray: [], visitedMapCount: "0/16")
        var dummyState = [ColorWithOpacityModel(name: "서울", opacity: 1, colorType: .pink(3)),
                          ColorWithOpacityModel(name: "경기도", opacity: 1, colorType: .orange(3)),
                          ColorWithOpacityModel(name: "인천", opacity: 1, colorType: .blue(1)),
                          ColorWithOpacityModel(name: "강원도", opacity: 1, colorType: .yellow(3)),
                          ColorWithOpacityModel(name: "충청북도", opacity: 1, colorType: .blue(2)),
                          ColorWithOpacityModel(name: "충청남도", opacity: 1, colorType: .pink(1)),
                          ColorWithOpacityModel(name: "대전", opacity: 1, colorType: .blue(3)),
                          ColorWithOpacityModel(name: "경상북도", opacity: 1, colorType: .purple(1)),
                          ColorWithOpacityModel(name: "경상남도", opacity: 1, colorType: .blue(0)),
                          ColorWithOpacityModel(name: "대구", opacity: 1, colorType: .purple(2)),
                          ColorWithOpacityModel(name: "울산", opacity: 1, colorType: .blue(1)),
                          ColorWithOpacityModel(name: "부산", opacity: 1, colorType: .yellow(0)),
                          ColorWithOpacityModel(name: "전라북도", opacity: 1, colorType: .blue(1)),
                          ColorWithOpacityModel(name: "전라남도", opacity: 1, colorType: .green(2)),
                          ColorWithOpacityModel(name: "광주", opacity: 1, colorType: .blue(1)),
                          ColorWithOpacityModel(name: "제주도", opacity: 1, colorType: .yellow(2))]
        var type = MapDeviceInset.width375Height812
        var inset: TopAndLeadingInset?
        var selectedMap: String?
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            return Observable.just(Mutation.setTotalMap(prepareTotalMap()))
        case .mapAction(let type):
            return Observable.just(Mutation.setSelectedMap(prepareSelectedMap(type: type)))
        case .mapInset(let layout):
            return Observable.just(Mutation.setMapInset(prepareMapLayoutInset(inset: layout)))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setTotalMap(let model):
            newState.totalMapState = model
        case .setSelectedMap(let specificModel):
            newState.totalMapState = specificModel
        case .setMapInset(let inset):
            newState.inset = inset
        }
        return newState
    }
}

extension HomeMapReactor {
    func prepareTotalMap() -> TotalMapModel {
        // 추후 여기서 서버 통신, 현재는 dummyResponse로 color 세팅
        let mapArray = initialState.dummyState.map({ data in
            MapModel(mapName: data.name, mapColor: data.colorType.color)
        })
        initialState.totalMapState = TotalMapModel(totalMapArray: mapArray, visitedMapCount: "0/16")
        return initialState.totalMapState
    }
    
    func prepareSelectedMap(type: RegionType) -> TotalMapModel {
        var tempState = initialState.totalMapState
        if let index = tempState.totalMapArray.firstIndex(where: { $0.mapName == type.rawValue }) {
            tempState.totalMapArray[index] = MapModel(mapName: type.rawValue,
                                                      mapColor: .mapSelect)
            tempState.selectedMap = SelectedMapModel(selectedMapName: type.rawValue, isHidden: false)
            initialState.selectedMap = type.rawValue
        }
        return tempState
    }
    
    func prepareClearMap() -> TotalMapModel {
        initialState.totalMapState.selectedMap = nil
        return initialState.totalMapState
    }
    
    func prepareMapLayoutInset(inset: DeviceSize) -> TopAndLeadingInset {
        return initialState.type.deviceInset(size: inset)
    }
}
