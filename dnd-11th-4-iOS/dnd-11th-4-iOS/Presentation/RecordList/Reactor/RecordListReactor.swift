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
    }
    
    struct State {
        var sections: [RecordSection] = []
    }
    
    init() {
        self.initialState = State()
    }
}

extension RecordListReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadRecords:
            let records = [
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드1", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드2", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드3", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드4", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드5", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드6", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드7", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드8", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드9", memo: "꾸르잼", date: "24.10.22"),
                Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드10", memo: "꾸르잼", date: "24.10.22")
            ]
            let section = RecordSection(header: "Records", items: records)
            return Observable.just(Mutation.setRecords([section]))
        case .deleteRecord(let indexPath):
            var sections = currentState.sections
            sections[indexPath.section].items.remove(at: indexPath.item)
            return Observable.just(Mutation.setRecords(sections))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setRecords(let sections):
            newState.sections = sections
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
    typealias Item = Test
    
    init(original: RecordSection, items: [Item]) {
        self = original
        self.items = items
    }
}
