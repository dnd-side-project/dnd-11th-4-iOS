//
//  RecordListReactor.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/7/24.
//

import UIKit
import ReactorKit
import RxSwift
import RxDataSources

final class RecordListReactor: Reactor {
    var initialState: State
    
    enum Action {
        case loadRecords
        case deleteRecord(IndexPath)
    }
    
    enum Mutation {
        case setRecords([RecordSection])
        case recordDeleted(Bool)
        case resetDeleteState
        case setError(MDError)
    }
    
    struct State {
        var sections: [RecordSection] = []
        var isRecordDeleted: Bool = false
        var detailRecords: [DetailRecordAppData] = [DetailRecordAppData(imageArray: [Constant.Image.imageDetailEmpty ?? UIImage()],
                                                                        region: "전라남도",
                                                                        place: "보성 녹차밭",
                                                                        memo: "녹차좋아",
                                                                        date: "24.10.22")]
    }
    
    init() {
        self.initialState = State()
    }
}

extension RecordListReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadRecords:
            return RecordListService.getRecordListAPI()
                .map { response in
                    let section = RecordSection(header: "Records", items: response.recordResponses)
                    return Mutation.setRecords([section])
                }
                .catch { error in
                    return Observable.just(Mutation.setError(NetworkManager.handleError(error)))
                }
        case .deleteRecord(let indexPath):
            var sections = currentState.sections
            sections[indexPath.section].items.remove(at: indexPath.item)
            return Observable.concat([
                Observable.just(Mutation.setRecords(sections)),
                Observable.just(Mutation.recordDeleted(true)),
                Observable.just(Mutation.resetDeleteState)
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setRecords(let sections):
            newState.sections = sections
        case .recordDeleted(let isDeleted):
            newState.isRecordDeleted = isDeleted
        case .resetDeleteState:
            newState.isRecordDeleted = false
        case .setError(let error):
            print(error)
        }
        return newState
    }
}

// MARK: - RxDataSource Section

struct RecordSection {
    var header: String
    var items: [Item]
}

extension RecordSection: SectionModelType {
    typealias Item = RecordResponse
    
    init(original: RecordSection, items: [Item]) {
        self = original
        self.items = items
    }
}
