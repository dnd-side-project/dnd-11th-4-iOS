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
        case setSelectedMap(SelectedMapModel?)
        case setMapInset(TopAndLeadingInset?)
        case setError(MDError)
    }
    
    struct State {
        var totalMapState: TotalMapModel?
        var inset: TopAndLeadingInset?
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            return HomeService.getHomeAPI()
                .map { response in
                    // 성공적인 경우
                    return Mutation.setTotalMap(self.prepareTotalMap(response))
                }
                .catch { error in
                    // 에러 발생 시
//                    NetworkManager.handleError(error)
                    return Observable.just(Mutation.setError(NetworkManager.handleError(error)))
                }
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
            print("⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️", model)
            newState.totalMapState = model
        case .setSelectedMap(let specificModel):
            newState.totalMapState?.selectedMap = specificModel
        case .setMapInset(let inset):
            newState.inset = inset
        case .setError(let error):
            print(error)
        }
        return newState
    }
}

extension HomeMapReactor {
    func prepareTotalMap(_ response: HomeResponse) -> TotalMapModel {
        let mapArray = response.regions.map { region -> MapModel in
            let colorType = OpacityColorType(response.selectedColor, region.opacity)
            return MapModel(mapName: region.name, mapColor: colorType.color)
        }
        return TotalMapModel(totalMapArray: mapArray, visitedMapCount: "\(response.visitCount)/\(response.totalCount)")
    }
    
    func prepareSelectedMap(type: RegionType) -> SelectedMapModel? {
        type.rawValue == "외부" ? nil : SelectedMapModel(selectedMapName: type.rawValue, isHidden: false)
    }
    
    func prepareMapLayoutInset(inset: DeviceSize) -> TopAndLeadingInset {
        return MapDeviceInset.deviceInset(size: inset)
    }
}
