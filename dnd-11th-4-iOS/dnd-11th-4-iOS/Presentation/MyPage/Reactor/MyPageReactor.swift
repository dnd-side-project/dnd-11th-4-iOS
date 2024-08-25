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
        case selectItem(IndexPath)
    }
    
    enum Mutation {
        case setSelectedItem(String)
    }
    
    struct State {
        var data: [(String, UIImage?)]
        var selectedItem: String?
    }
    
    init() {
        self.initialState = State(data: [
            ("1:1 문의", UIImage(resource: .iconMyPage)),
            ("서비스 탈퇴", UIImage(resource: .iconSetting))
        ])
    }
}

extension MyPageReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .selectItem(indexPath):
            let selectedItem = self.currentState.data[indexPath.row].0
            return Observable.just(Mutation.setSelectedItem(selectedItem))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setSelectedItem(item):
            newState.selectedItem = item
        }
        return newState
    }
}
