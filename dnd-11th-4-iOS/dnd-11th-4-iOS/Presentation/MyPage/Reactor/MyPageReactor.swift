//
//  MyPageReactor.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/23/24.
//

import Foundation
import ReactorKit
import RxSwift

final class MyPageReactor: Reactor {
    var initialState: State
    
    enum Action {
        case fetchUserName
        case selectItem(IndexPath)
    }
    
    enum Mutation {
        case setUserName(String)
        case setSelectedItem(String)
        case setError(MDError)
    }
    
    struct State {
        var data: [(String, UIImage?)]
        var selectedItem: String?
        var userName: String
        var error: MDError?
    }
    
    init() {
        self.initialState = State(data: [
            ("1:1 문의", UIImage(resource: .iconMyPage)),
            ("서비스 탈퇴", UIImage(resource: .iconSetting))
        ], userName: "")
    }
}

extension MyPageReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .fetchUserName:
            return MyPageService.getMyPageAPI()
                .map { response in
                    return Mutation.setUserName(response.name)
                }
                .catch { error in
                    let handledError = NetworkManager.handleError(error)
                    return Observable.just(Mutation.setError(handledError))
                }
        case let .selectItem(indexPath):
            let selectedItem = self.currentState.data[indexPath.row].0
            return Observable.just(Mutation.setSelectedItem(selectedItem))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setUserName(userName):
            newState.userName = userName
        case let .setSelectedItem(item):
            newState.selectedItem = item
        case .setError(let error):
            newState.error = error
        }
        return newState
    }
}
